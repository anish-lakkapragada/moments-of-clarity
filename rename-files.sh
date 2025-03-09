#!/bin/bash

# Check if pdftk is installed
if ! command -v pdftk &> /dev/null; then
    #echo "Error: pdftk is not installed. Please install it first."
    #echo "On Debian/Ubuntu: sudo apt-get install pdftk"
    #echo "On Fedora: sudo dnf install pdftk"
    #echo "On macOS with Homebrew: brew install pdftk-java"
    exit 1
fi

# Check if correct number of arguments provided
if [ $# -ne 2 ]; then
    #echo "Usage: $0 <directory_with_pdfs> <template_pdf>"
    #echo "  <directory_with_pdfs>: Directory containing PDFs to process"
    #echo "  <template_pdf>: PDF file whose first page will be concatenated with each PDF"
    exit 1
fi

# Assign arguments to variables and convert to absolute paths
pdf_directory=$(realpath "$1")
template_pdf=$(realpath "$2")

# Check if directory exists
if [ ! -d "$pdf_directory" ]; then
    #echo "Error: Directory '$pdf_directory' does not exist."
    exit 1
fi

# Check if template PDF exists
if [ ! -f "$template_pdf" ]; then
    #echo "Error: Template PDF file '$template_pdf' does not exist."
    exit 1
fi

#echo "Directory: $pdf_directory"
#echo "Template PDF: $template_pdf"

#echo "Step 1: Renaming PDF files in natural sort order..."

# Save current directory to return to it later
original_dir=$(pwd)

# Change to the specified directory for the renaming operation
cd "$pdf_directory"

# Create a temporary directory for the renaming operation
rename_temp_dir=$(mktemp -d)
#echo "Created temporary directory for renaming: $rename_temp_dir"

# Get all PDF files and sort them naturally
# Natural sort treats numbers as numbers, not as characters
IFS=$'\n' sorted_files=($(find . -maxdepth 1 -type f -name "*.pdf" -exec basename {} \; | sort -V))
unset IFS

# If no files found
if [ ${#sorted_files[@]} -eq 0 ]; then
    #echo "No PDF files found in the directory."
    rmdir "$rename_temp_dir"
    exit 1
fi

#echo "Found ${#sorted_files[@]} PDF files to process."

# Counter for new filenames
count=1

# Get basename of template PDF for comparison
template_basename=$(basename "$template_pdf")

# Process files in natural sort order
for filename in "${sorted_files[@]}"; do
    # Skip the template PDF if it's in the same directory
    if [ "$filename" = "$template_basename" ]; then
        #echo "Skipping template PDF from renaming: $filename"
        continue
    fi
    
    #echo "Renaming: $filename -> $count.pdf"
    # Copy file to temp directory with new name
    cp "$filename" "$rename_temp_dir/$count.pdf"
    # Increment counter
    ((count++))
done

# Remove all original PDF files except the template
for filename in "${sorted_files[@]}"; do
    if [ "$filename" != "$template_basename" ]; then
        rm "$filename"
    fi
done

# Move the renamed files back
for file in "$rename_temp_dir"/*; do
    basename=$(basename "$file")
    mv "$file" "./$basename"
    #echo "Moved: $basename"
done

# Remove the temporary directory
rmdir "$rename_temp_dir"
#echo "Files have been renamed according to natural sort order."

#echo "Step 2: Concatenating first page of template PDF with each PDF..."

# Create a temporary directory for the concatenation operation
concat_temp_dir=$(mktemp -d)
#echo "Created temporary directory for concatenation: $concat_temp_dir"

# Extract first page from template PDF
#echo "Extracting first page from template PDF..."
pdftk "$template_pdf" cat 1 output "$concat_temp_dir/first_page.pdf"

# Process each PDF in the directory
#echo "Processing PDFs in directory: $pdf_directory"
concat_count=0

for pdf_file in "$pdf_directory"/*.pdf; do
    # Get absolute path of the current PDF
    absolute_pdf_path=$(realpath "$pdf_file")
    
    # Skip the template PDF
    if [ "$absolute_pdf_path" = "$template_pdf" ]; then
        #echo "Skipping template PDF from concatenation: $(basename "$pdf_file")"
        continue
    fi
    
    # Get base filename
    filename=$(basename "$pdf_file")
    #echo "Processing: $filename"
    
    # Concatenate first page with current PDF and save to a temporary file
    temp_output="$concat_temp_dir/temp_output.pdf"
    pdftk A="$concat_temp_dir/first_page.pdf" B="$pdf_file" cat A1 B output "$temp_output"
    
    # Replace the original file with the concatenated version
    mv "$temp_output" "$pdf_file"
    
    #echo "Modified: $filename (first page concatenated)"
    concat_count=$((concat_count+1))
done

# Clean up temporary directory
rm -rf "$concat_temp_dir"
#echo "Cleaned up temporary directories"

# Return to the original directory
cd "$original_dir"

# Summary
#echo "Summary:"
#echo "1. Renamed PDF files in natural sort order."
#echo "2. Concatenated the first page of the template with $concat_count PDF files."
#echo "All operations completed successfully."
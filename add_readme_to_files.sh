#!/bin/bash

# Check if pdftk is installed
if ! command -v pdftk &> /dev/null; then
    echo "Error: pdftk is not installed. Please install it first."
    echo "On Debian/Ubuntu: sudo apt-get install pdftk"
    echo "On Fedora: sudo dnf install pdftk"
    echo "On macOS with Homebrew: brew install pdftk-java"
    exit 1
fi

# Check if correct number of arguments provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory_with_pdfs> <template_pdf>"
    echo "  <directory_with_pdfs>: Directory containing PDFs to process"
    echo "  <template_pdf>: PDF file whose first page will be concatenated with each PDF"
    exit 1
fi

# Assign arguments to variables
pdf_directory="$1"
template_pdf="$2"

# Check if directory exists
if [ ! -d "$pdf_directory" ]; then
    echo "Error: Directory '$pdf_directory' does not exist."
    exit 1
fi

# Check if template PDF exists
if [ ! -f "$template_pdf" ]; then
    echo "Error: Template PDF file '$template_pdf' does not exist."
    exit 1
fi

# Create a temporary directory to work in
temp_dir=$(mktemp -d)
echo "Created temporary directory: $temp_dir"

# Extract first page from template PDF
echo "Extracting first page from template PDF..."
pdftk "$template_pdf" cat 1 output "$temp_dir/first_page.pdf"

# Create output directory
output_dir="$pdf_directory/concatenated"
mkdir -p "$output_dir"
echo "Created output directory: $output_dir"

# Process each PDF in the directory
echo "Processing PDFs in directory: $pdf_directory"
count=0
for pdf_file in "$pdf_directory"/*.pdf; do
    # Skip the template PDF if it's in the same directory
    if [ "$(realpath "$pdf_file")" = "$(realpath "$template_pdf")" ]; then
        echo "Skipping template PDF: $pdf_file"
        continue
    fi
    
    # Get base filename
    filename=$(basename "$pdf_file")
    echo "Processing: $filename"
    
    # Concatenate first page with current PDF
    pdftk A="$temp_dir/first_page.pdf" B="$pdf_file" cat A1 B output "$output_dir/concatenated_$filename"
    
    echo "Created: concatenated_$filename"
    count=$((count+1))
done

# Clean up temporary directory
rm -rf "$temp_dir"
echo "Cleaned up temporary directory"

# Summary
echo "Completed processing $count PDF files."
echo "Concatenated PDFs are located in: $output_dir"
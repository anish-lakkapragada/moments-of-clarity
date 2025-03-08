#!/bin/bash

# Check if directory argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Check if the provided argument is a directory
if [ ! -d "$1" ]; then
    echo "Error: '$1' is not a directory"
    exit 1
fi

# Change to the specified directory
cd "$1"

# Create a temporary directory for the operation
temp_dir=$(mktemp -d)

# Get all PDF files and sort them naturally
# This uses the -v flag of sort which implements "natural sort" like Finder
# Natural sort treats numbers as numbers, not as characters
IFS=$'\n' sorted_files=($(find . -maxdepth 1 -type f -name "*.pdf" -exec basename {} \; | sort -V))
unset IFS

# If no files found
if [ ${#sorted_files[@]} -eq 0 ]; then
    echo "No PDF files found in the directory."
    rmdir "$temp_dir"
    exit 1
fi

# Counter for new filenames
count=1

# Process files in natural sort order
for filename in "${sorted_files[@]}"; do
    # Copy file to temp directory with new name
    cp "$filename" "$temp_dir/$count.pdf"
    
    # Increment counter
    ((count++))
done

# Remove all original PDF files
find . -maxdepth 1 -name "*.pdf" -type f -delete

# Move the renamed files back
for file in "$temp_dir"/*; do
    basename=$(basename "$file")
    mv "$file" "./$basename"
done

# Remove the temporary directory
rmdir "$temp_dir"

# echo "Files have been renamed according to natural sort order (similar to Finder)."
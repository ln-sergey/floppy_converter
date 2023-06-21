#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error: Please provide the source directory as the first argument. (/app/path/to/folder)"
    exit 1
fi

source_dir="$1"
base_name=$(basename "$source_dir")
disk_name=$(echo "$base_name" | tr -c '[:alnum:]\n\r' '_' | tr '[:upper:]' '[:lower:]' | sed 's/$/_disk/')

echo "! This script should be executed inside alpine based Docker container" \
    "Source directory is: $source_dir" \
    "\n\nImage will be located in: $(pwd)/$disk_name.ima\n\n"

# Install alpine pkg for creating .ima
apk add mtools dosfstools

# Check if the total size of the directory exceeds 1440 KB
# total_size=$(du -sk "$source_dir" | awk '{print $1}')
# if [ "$total_size" -gt 1440 ]; then
#     echo "Error: Directory size exceeds the limit of 1440 KB."
#     exit 1
# fi

mkdosfs -C "$disk_name.ima" 1440

mkdir masm_mnt_tmp

mount -o loop "$disk_name.ima" masm_mnt_tmp
cp -r "$source_dir"/* masm_mnt_tmp/

umount masm_mnt_tmp
rm -rf masm_mnt_tmp
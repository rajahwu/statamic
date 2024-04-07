#!/bin/bash

# Check if directory path is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

# Get directory path from command line argument
directory_path=$1

# Check if directory exists
if [ ! -d "$directory_path" ]; then
    echo "Error: Directory '$directory_path' not found."
    exit 1
fi

# Grant execute permissions to all files in the directory
chmod +x "$directory_path"/*

# Inform user about the permissions granted
echo "Execute permissions granted to all files in directory: $directory_path"

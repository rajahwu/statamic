#!/bin/bash

# Function to print colored text
print_color() {
    local color=$1
    local message=$2
    echo -e "${color}${message}\033[0m"
}

# Set the directory path
directory_path="/var/www/html/apps/Training/php_frameworks/statamic/statamic-in-laravel"

# Print the permissions for the specified directory and its subdirectories
echo "Permissions for $directory_path and its subdirectories:"
print_color '\033[0;36m' "Directory: $directory_path"
ls -ld "$directory_path"
print_color '\033[0;36m' "Subdirectory: $directory_path/storage"
ls -ld "$directory_path/storage"
print_color '\033[0;36m' "Subdirectory: $directory_path/content"
ls -ld "$directory_path/content"
print_color '\033[0;36m' "Subdirectory: $directory_path/bootstrap/cache"
ls -ld "$directory_path/bootstrap/cache"

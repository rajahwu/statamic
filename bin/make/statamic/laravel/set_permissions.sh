#!/bin/bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'  # Yellow color
NC='\033[0m' # No Color

# Get the directory of the current script
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if argument is provided
if [ $# -ne 1 ]; then
    echo -e "${RED}Usage: $0 <directory_path>${NC}"
    exit 1
fi

# Assign the directory path from the argument
directory_path=$1

# Function to print success message in green color
print_success() {
    echo -e "${GREEN}$1${NC}"
}

# Function to print error message in red color
print_error() {
    echo -e "${RED}$1${NC}"
}

# Function to print message in yellow color
print_yellow() {
    echo -e "${YELLOW}$1${NC}"
}

# Set permissions and ownership for the specified directory
if sudo chmod -R 755 "$directory_path"; then
    print_success "Permissions set for directory: $directory_path"
else
    print_error "Failed to set permissions for directory: $directory_path"
    exit 1
fi

if sudo chown -R www-data:www-data "$directory_path"; then
    print_success "Ownership changed for directory: $directory_path"
else
    print_error "Failed to change ownership for directory: $directory_path"
    exit 1
fi

# Set permissions and ownership for specific subdirectories
if sudo chown -R www-data:www-data "$directory_path/storage"; then
    print_success "Ownership changed for directory: $directory_path/storage"
else
    print_error "Failed to change ownership for directory: $directory_path/storage"
fi

if sudo chown -R www-data:www-data "$directory_path/content"; then
    print_success "Ownership changed for directory: $directory_path/content"
else
    print_error "Failed to change ownership for directory: $directory_path/content"
fi

if sudo chown -R www-data:www-data "$directory_path/bootstrap/cache"; then
    print_success "Ownership changed for directory: $directory_path/bootstrap/cache"
else
    print_error "Failed to change ownership for directory: $directory_path/bootstrap/cache"
fi

# Execute show_permissions.sh in the same directory as this script
print_yellow "Executing show_permissions.sh"
"$script_dir/show_permissions.sh"

#!/bin/bash

echo -e "\n\nStarting... Please be patient.\n\n"

# Apply execute permissions to all files in the current directory
chmod +x *

# Redirect all standard output (stdout) and standard error (stderr) to /dev/null
exec > /dev/null 2>&1

# Function to install packages based on detected package manager
install_packages() {
  if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y gawk jq
  elif command -v yum >/dev/null 2>&1; then
    sudo yum install -y gawk jq
  elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y gawk jq
  elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -Sy --noconfirm gawk jq
  elif command -v zypper >/dev/null 2>&1; then
    sudo zypper install -y gawk jq
  else
    echo "Unsupported Linux distribution." >&2
    exit 1
  fi
}

# Determine the Linux distribution and install packages
install_packages

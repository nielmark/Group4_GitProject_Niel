#!/bin/bash

echo -e "\n\nStarting... Please wait.\n\n"
# echo $OSTYPE
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
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    install_gawk_and_bash
  else
    echo "Unsupported OS." >&2
    exit 1
  fi
}

install_gawk_and_bash() {
  {
    # To check if the bash and gawk are installed on the system.
    if ! brew list gawk >/dev/null 2>&1 || ! brew list bash >/dev/null 2>&1; then
      # Install gawk if not installed
      if ! brew list gawk >/dev/null 2>&1; then
        yes | brew install gawk
      fi

      # Install bash if not installed
      if ! brew list bash >/dev/null 2>&1; then
        yes | brew install bash
      fi

      # Install jq if not installed
      if ! brew list jq >/dev/null 2>&1; then
        yes | brew install jq
      fi
    fi

  } >/dev/null 2>&1
  
}

# Determine the OS and install packages
install_packages

#!/bin/bash
set -e

DEFAULT_UTILITY_URL="https://release.lkc-lab.com"
DEFAULT_UTILITY_VERSION="latest"

UTILITY_ARCHIVE="utility.tar.gz"
UTILITY_VERSION="${VERSION:-$DEFAULT_UTILITY_VERSION}"
UTILITY_URL="${URL:-$DEFAULT_UTILITY_URL}"
UTILITY_DOWNLOAD_LINK="$UTILITY_URL/vm-utility/$UTILITY_VERSION/$UTILITY_ARCHIVE"

echo "Downloading VM Utility version: $UTILITY_VERSION..."

if wget -q --show-progress -O $UTILITY_ARCHIVE "$UTILITY_DOWNLOAD_LINK"; then
  echo "VM Utility downloaded successfully!"
else
  echo "Failed to download VM Utility version: $UTILITY_VERSION"
  exit 1
fi

echo "Installing VM Utility..."
mkdir -p "$HOME/utility"
tar zxvf utility.tgz -C "$HOME/utility"

echo "Setup VM Utility..."
echo "source \"\$HOME/utility/shell.sh\"" > "$HOME/.bash_login"

echo "VM Utility has been installed successfully!"

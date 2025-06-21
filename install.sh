#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Default installation directory
DEFAULT_PREFIX="/usr/local"
PREFIX="${PREFIX:-$DEFAULT_PREFIX}"
INSTALL_DIR="$PREFIX/bin"

# GitHub repository
REPO_URL="https://raw.githubusercontent.com/jezhou/flac-to-alac/main"

echo "Installing flac-to-alac..."
echo ""

# Check for Python 3.6+
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}Error: Python 3 is not installed.${NC}"
    echo "Please install Python 3.6 or later to use flac-to-alac."
    exit 1
fi

PYTHON_VERSION=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
REQUIRED_VERSION="3.6"

if ! python3 -c "import sys; exit(0 if sys.version_info >= (3, 6) else 1)"; then
    echo -e "${RED}Error: Python $PYTHON_VERSION is installed, but Python $REQUIRED_VERSION or later is required.${NC}"
    exit 1
fi

echo -e "${GREEN}✓${NC} Python $PYTHON_VERSION detected"

# Check for ffmpeg
if ! command -v ffmpeg &> /dev/null; then
    echo -e "${YELLOW}Warning: ffmpeg is not installed.${NC}"
    echo "flac-to-alac requires ffmpeg to function properly."
    echo ""
    echo "To install ffmpeg:"
    echo "  macOS:           brew install ffmpeg"
    echo "  Ubuntu/Debian:   sudo apt-get install ffmpeg"
    echo "  Fedora:          sudo dnf install ffmpeg"
    echo "  Arch:            sudo pacman -S ffmpeg"
    echo ""
    read -p "Continue installation anyway? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
else
    echo -e "${GREEN}✓${NC} ffmpeg detected"
fi

# Create installation directory if it doesn't exist
if [ ! -d "$INSTALL_DIR" ]; then
    echo "Creating installation directory: $INSTALL_DIR"
    if [ "$PREFIX" = "/usr/local" ]; then
        sudo mkdir -p "$INSTALL_DIR"
    else
        mkdir -p "$INSTALL_DIR"
    fi
fi

# Download the script
echo "Downloading flac-to-alac..."
TMP_FILE=$(mktemp)

if command -v curl &> /dev/null; then
    curl -fsSL "$REPO_URL/flac-to-alac" -o "$TMP_FILE"
elif command -v wget &> /dev/null; then
    wget -q "$REPO_URL/flac-to-alac" -O "$TMP_FILE"
else
    echo -e "${RED}Error: Neither curl nor wget is available.${NC}"
    echo "Please install curl or wget to download flac-to-alac."
    exit 1
fi

# Install the script
echo "Installing to $INSTALL_DIR/flac-to-alac..."
if [ "$PREFIX" = "/usr/local" ]; then
    sudo cp "$TMP_FILE" "$INSTALL_DIR/flac-to-alac"
    sudo chmod +x "$INSTALL_DIR/flac-to-alac"
else
    cp "$TMP_FILE" "$INSTALL_DIR/flac-to-alac"
    chmod +x "$INSTALL_DIR/flac-to-alac"
fi

# Clean up
rm -f "$TMP_FILE"

# Verify installation
if command -v flac-to-alac &> /dev/null; then
    echo -e "${GREEN}✓${NC} flac-to-alac has been successfully installed!"
    echo ""
    echo "You can now use flac-to-alac. Try:"
    echo "  flac-to-alac -h"
    echo ""
    echo "To uninstall, run:"
    if [ "$PREFIX" = "/usr/local" ]; then
        echo "  sudo rm $INSTALL_DIR/flac-to-alac"
    else
        echo "  rm $INSTALL_DIR/flac-to-alac"
    fi
else
    echo -e "${YELLOW}Warning: Installation completed, but flac-to-alac is not in your PATH.${NC}"
    echo "Add $INSTALL_DIR to your PATH or use the full path: $INSTALL_DIR/flac-to-alac"
fi
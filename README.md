# flac-to-alac

A command-line tool to convert FLAC audio files to ALAC (Apple Lossless Audio Codec) in M4A container format.

## Why

I have a very specific use case where I have a bunch of nested flac files I wanted to convert so I could play them in Apple Music / my iPod, and I couldn't find an out-of-the-box online utility to this for me
(the closest I could find was [this link](https://unix.stackexchange.com/questions/415477/lossless-audio-conversion-from-flac-to-alac-using-ffmpeg)). It seemed worth it to make this utility for myself.

For transparency, most of the legwork was done by Claude Code and audited / tweaked by me. Feel free to audit the code before using it yourself.

## Features

- Convert single FLAC files to ALAC/M4A
- Batch convert entire directories recursively
- Preserve directory structure when converting
- Specify custom output directory for batch conversions
- Preserves album artwork and metadata

## Requirements

- Python 3.6+
- ffmpeg

## Installation

### Quick Install (Recommended)

Install with a single command:

```bash
curl -fsSL https://raw.githubusercontent.com/jezhou/flac-to-alac/main/install.sh | bash
```

Or download and review the install script first:

```bash
curl -fsSL https://raw.githubusercontent.com/jezhou/flac-to-alac/main/install.sh -o install.sh
chmod +x install.sh
./install.sh
```

To install to a custom location (default is `/usr/local/bin`):

```bash
PREFIX=$HOME/.local ./install.sh
```

### Manual Installation

1. Ensure ffmpeg is installed:

   ```bash
   # macOS
   brew install ffmpeg

   # Ubuntu/Debian
   sudo apt-get install ffmpeg

   # Fedora
   sudo dnf install ffmpeg

   # Arch
   sudo pacman -S ffmpeg
   ```

2. Clone this repository:

   ```bash
   git clone https://github.com/jezhou/flac-to-alac.git
   cd flac-to-alac
   ```

3. Make the script executable:

   ```bash
   chmod +x flac-to-alac
   ```

4. Copy to your PATH:
   ```bash
   sudo cp flac-to-alac /usr/local/bin/
   ```

### Update

To update to the latest version:

```bash
flac-to-alac --update
```

Or reinstall using the install script:

```bash
curl -fsSL https://raw.githubusercontent.com/jezhou/flac-to-alac/main/install.sh | bash
```

### Uninstall

To remove flac-to-alac:

```bash
sudo rm /usr/local/bin/flac-to-alac
```

## Usage

### Convert a single file

```bash
flac-to-alac -f song.flac
```

This will create `song.m4a` in the same directory as the input file.

### Convert all FLAC files in a directory

```bash
flac-to-alac -d ./music
```

This will recursively find all FLAC files in the `./music` directory and convert them to M4A, preserving the directory structure.

### Convert with custom output directory

```bash
flac-to-alac -d ./music -o ./converted
```

This will convert all FLAC files from `./music` and save the M4A files to `./converted`, maintaining the original directory structure.

### Check version

```bash
flac-to-alac --version
```

### Help

```bash
flac-to-alac -h
```

## Notes

- The tool uses ffmpeg's ALAC encoder for lossless conversion
- Album artwork and metadata are preserved during conversion
- The `-o` option only works with the `-d` (directory) option

## License

MIT License

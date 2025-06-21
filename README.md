# flac-to-alac

A command-line tool to convert FLAC audio files to ALAC (Apple Lossless Audio Codec) in M4A container format.

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

### Via Homebrew (coming soon)

```bash
brew install flac-to-alac
```

### Manual Installation

1. Ensure ffmpeg is installed:
   ```bash
   # macOS
   brew install ffmpeg
   
   # Ubuntu/Debian
   sudo apt-get install ffmpeg
   ```

2. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/flac-to-alac.git
   cd flac-to-alac
   ```

3. Make the script executable:
   ```bash
   chmod +x flac-to-alac
   ```

4. Optionally, copy to your PATH:
   ```bash
   sudo cp flac-to-alac /usr/local/bin/
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
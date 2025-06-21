from setuptools import setup

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

setup(
    name="flac-to-alac",
    version="1.0.0",
    author="Your Name",
    author_email="your.email@example.com",
    description="A CLI tool to convert FLAC audio files to ALAC/M4A format",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/yourusername/flac-to-alac",
    scripts=["flac-to-alac"],
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        "Environment :: Console",
        "Topic :: Multimedia :: Sound/Audio :: Conversion",
    ],
    python_requires=">=3.6",
    install_requires=[],
)
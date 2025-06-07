#!/bin/bash
set -e

# Download and install Flutter
git clone https://github.com/flutter/flutter.git -b stable --depth 1 flutter
export PATH="$PATH:`pwd`/flutter/bin"

# Verify installation
flutter --version
flutter config --enable-web
flutter doctor

# Make flutter available for the rest of the build
echo 'export PATH="$PATH:'`pwd`'/flutter/bin"' >> $HOME/.bashrc
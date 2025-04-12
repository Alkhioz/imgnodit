#!/bin/bash

set -e

echo "🔧 Cleaning build directory..."
rm -rf build/
mkdir -p build

echo "🔨 Compiling C to WASM..."
emcc csrc/*.c -Os \
  -s WASM=1 \
  -s MODULARIZE \
  -s EXPORT_NAME=imgnoditModule \
  -o build/imgnodit.js

echo "📄 Copying WASM binary..."
# emcc will already do this, but make sure it ends up in build/
# If needed: cp imgnodit.wasm build/

echo "📦 Copying JavaScript files (excluding test files)..."
find src -name '*.js' ! -name '*.test.js' ! -path '*/tests/*' -exec cp --parents {} build/ \;

echo "📄 Copying index.html and assets..."
cp public/index.html build/
[ -f public/style.css ] && cp public/style.css build/

echo "✅ Build complete. Ready in ./build"
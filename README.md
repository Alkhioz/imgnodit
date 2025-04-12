# imgnodit
A modular, node-based, non-destructive image editor powered by **vanilla JavaScript**, **C**, and **WebAssembly** — optimized for creativity, transparency, and performance.

---

## Features (WIP)
- Node-based image editing workflow
- Real-time, non-destructive pipeline
- C-powered image processing (compiled to WASM)
- Vanilla JS frontend (no bundler)
- Clean architecture, modular code
- Designed to be mobile-friendly and fast

---

## Getting Started (WSL2 Ubuntu)

> These steps are tested on **WSL2 with Ubuntu**, but should work on any Linux system.

### Prerequisites

Install required packages:

```bash
sudo apt update
sudo apt install clang clang-tidy build-essential cmake git curl python3
```

### Install Emscripten (for compiling C to WASM)

```bash
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh
echo "source ~/emsdk/emsdk_env.sh" >> ~/.bashrc
```

### Project Structure

imgnodit/
├── public/         # HTML entry point (index.html)
├── src/            # Vanilla JS code (graph logic, nodes, UI)
├── csrc/           # C code to compile to WASM
├── build/          # Output folder for compiled WASM and JS glue
├── .clang-tidy     # Lint rules for C
├── .eslintrc.json  # Lint rules for JS
├── package.json
└── README.md

## Build & Run

### Install JS dependencies (for linting)

```bash
npm install
```

### Build the C → WASM module

```bash
npm run build:wasm
```

### Lint C code

```bash
npm run lint:c
```

### Serve with live-server

```bash
npx live-server public
```

Then visit: http://localhost:3000

### 
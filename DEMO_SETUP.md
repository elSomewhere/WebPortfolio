# Portfolio Integration Guide

This document explains how to integrate the Trading Simulation 3D project into a portfolio as a git submodule.

## Integration Steps

### 1. Add as Git Submodule

Add this project to your portfolio's `demos/` directory:

```bash
git submodule add https://github.com/yourusername/CppExchangeSim.git demos/trading-simulation-3d
cd demos/trading-simulation-3d
npm install
```

### 2. Build for Portfolio

Build the project in submodule mode:

```bash
npm run build:submodule
```

This creates optimized builds in the `dist/` directory with correct asset paths for portfolio integration.

### 3. Portfolio Page Template

Create an Astro page at `src/pages/demos/trading-simulation-3d.astro`:

```astro
---
// src/pages/demos/trading-simulation-3d.astro
const title = "Trading Simulation 3D";
const description = "High-Frequency Trading Simulation with 3D Order Book Visualization";
---

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{title}</title>
    <meta name="description" content={description}>
    <style>
        body { margin: 0; padding: 0; overflow: hidden; }
        iframe { width: 100vw; height: 100vh; border: none; }
    </style>
</head>
<body>
    <iframe 
        src="/demos/trading-simulation-3d/dist/trading_simulation_3d_logviz.html"
        title={description}
        allowfullscreen>
    </iframe>
</body>
</html>
```

### 4. Cover Image

The project includes a `cover.svg` file for the portfolio homepage. Copy it to:
```
public/demos/trading-simulation-3d/cover.svg
```

### 5. Portfolio Homepage Integration

Add the project to your portfolio's homepage with:

```javascript
// Portfolio data structure
{
  slug: "trading-simulation-3d",
  title: "Trading Simulation 3D",
  description: "High-Frequency Trading Simulation with 3D Order Book Visualization and GPU-accelerated Log Viewer",
  tech: ["WebAssembly", "WebGL", "Three.js", "C++", "Emscripten"],
  image: "/demos/trading-simulation-3d/cover.svg",
  url: "/demos/trading-simulation-3d",
  featured: true
}
```

## Build System Integration

### Directory Structure
```
portfolio/
├── demos/
│   └── trading-simulation-3d/          # Git submodule
│       ├── dist/                       # Built files (after npm run build:submodule)
│       │   ├── trading_simulation_3d_logviz.html
│       │   ├── trading_simulation_3d_canvas2d.html
│       │   ├── *.js
│       │   └── *.wasm
│       ├── public/                     # Source HTML files
│       ├── public-static/              # JavaScript modules
│       ├── src/                        # C++ source
│       ├── cover.svg                   # Portfolio cover image
│       ├── package.json
│       └── README.md
├── public/
│   └── demos/
│       └── trading-simulation-3d/
│           └── cover.svg               # Copy of cover image
└── src/
    └── pages/
        └── demos/
            └── trading-simulation-3d.astro  # Portfolio page
```

### Asset Paths

The build system automatically configures asset paths:

- **Standalone mode** (`npm run build:standalone`): Base path is `/`
- **Submodule mode** (`npm run build:submodule`): Base path is `/demos/trading-simulation-3d/dist/`

This ensures all assets (JavaScript, WASM, images) load correctly in both contexts.

## Available Demos

The project provides two main demo pages:

1. **LogViz Edition** (`trading_simulation_3d_logviz.html`)
   - GPU-accelerated log visualization using WebGL
   - Recommended for performance

2. **Canvas2D Edition** (`trading_simulation_3d_canvas2d.html`)
   - Traditional Canvas 2D-based log visualization
   - Better compatibility with older browsers

Both versions include:
- Real-time 3D order book visualization
- WebAssembly-based trading simulation
- Interactive controls and configuration
- Multi-trader agent system

## Auto-Update Setup (Optional)

To automatically rebuild the portfolio when this project updates:

1. Add a GitHub webhook or action to trigger portfolio rebuilds
2. Use the notification workflow pattern from the portfolio template
3. Set up CI/CD to run `npm run build:submodule` and commit the dist files

## Development Workflow

1. **Develop in isolation**: Use `npm run dev` in the submodule for standalone development
2. **Test integration**: Use `npm run build:submodule` and verify in portfolio context
3. **Deploy**: Portfolio deployment system picks up the built `dist/` files

## Technical Notes

- **WASM Files**: Handled correctly by the build system, copied as-is
- **JavaScript Modules**: All modules in `public-static/` are copied to `public/` and work with traditional script tags
- **Three.js**: Loaded from CDN, consistent across both modes
- **WebGL**: Requires modern browser with WebGL support
- **Performance**: Optimized for 60 FPS with WebAssembly simulation engine 
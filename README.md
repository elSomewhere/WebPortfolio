# Portfolio Build System

## Development

```bash
npm run dev
```

## Building Demos

The portfolio includes git submodules for individual demo projects. To build all demos and prepare for deployment:

```bash
npm run build:demos  # Builds all submodules and copies to public/
npm run build        # Builds demos + portfolio (full build)
```

## Demo Integration

Demos are integrated as git submodules in `demos/` and their built files are copied to `public/demos/` for serving.

### Current Demos
- **orderbook-3d**: High-Frequency Trading Simulation with 3D Order Book Visualization

### Adding New Demos
1. Add as git submodule: `git submodule add <repo> demos/<name>`
2. Update `scripts/build-demos.sh` to include the new demo
3. Create demo page at `src/pages/demos/<name>.astro`
4. Add to `src/data/projects.ts`
5. Add cover image at `public/demos/<name>/cover.svg`

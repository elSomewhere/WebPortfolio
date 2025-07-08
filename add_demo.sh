#!/bin/bash

# Script to add a new demo submodule to the WebPortfolio project
# Usage: ./add_demo.sh <git-url> [branch]

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if git URL is provided
if [ -z "$1" ]; then
    echo -e "${RED}Error: Please provide a git repository URL${NC}"
    echo "Usage: ./add_demo.sh <git-url> [branch]"
    exit 1
fi

GIT_URL=$1
BRANCH=${2:-main}

# Extract repo name from URL
REPO_NAME=$(basename "$GIT_URL" .git)

# Check if demos directory exists
if [ ! -d "demos" ]; then
    mkdir -p demos
fi

# Add submodule
echo -e "${GREEN}Adding submodule: $REPO_NAME${NC}"
git submodule add -b "$BRANCH" "$GIT_URL" "demos/$REPO_NAME"

# Update submodules
git submodule update --init --recursive

# Create Astro page for the new demo
DEMO_PAGE="src/pages/demos/${REPO_NAME}.astro"
echo -e "${GREEN}Creating demo page: $DEMO_PAGE${NC}"

cat > "$DEMO_PAGE" << EOF
---
import Layout from '../../layouts/Layout.astro';

const base = "/demos/${REPO_NAME}/dist/";
---

<Layout title="${REPO_NAME} | Esteban Lanter">
  <div class="demo-container">
    <header class="demo-header">
      <a href="/" class="back-link">← Back to Portfolio</a>
      <h1>${REPO_NAME}</h1>
      <p>Interactive visualization</p>
    </header>
    
    <iframe 
      src={\`\${base}index.html\`} 
      class="demo-frame"
      title="${REPO_NAME} Visualization"
    />
  </div>
</Layout>

<style>
  .demo-container {
    display: flex;
    flex-direction: column;
    height: 100vh;
  }

  .demo-header {
    padding: 1rem 2rem;
    background: rgba(0, 0, 0, 0.9);
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
  }

  .back-link {
    color: var(--accent-1);
    text-decoration: none;
    font-size: 0.9rem;
    transition: opacity 0.3s ease;
  }

  .back-link:hover {
    opacity: 0.7;
  }

  .demo-header h1 {
    margin: 0.5rem 0 0;
    font-size: 1.5rem;
    text-transform: uppercase;
  }

  .demo-header p {
    margin: 0.25rem 0 0;
    opacity: 0.7;
    font-size: 0.9rem;
  }

  .demo-frame {
    flex: 1;
    width: 100%;
    border: 0;
    background: #000;
  }
</style>
EOF

# Update index page notice
echo -e "${GREEN}Remember to update src/pages/index.astro with the new demo information!${NC}"

# Commit changes
echo -e "${GREEN}Committing changes...${NC}"
git add .
git commit -m "feat: add ${REPO_NAME} demo"

echo -e "${GREEN}✓ Demo submodule added successfully!${NC}"
echo -e "${GREEN}Next steps:${NC}"
echo "1. Update src/pages/index.astro with demo metadata"
echo "2. Ensure the demo repo has a built 'dist' folder"
echo "3. Push changes: git push" 
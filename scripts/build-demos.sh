#!/bin/bash

# Build script for demo submodules
# This script builds all demo submodules and copies their dist files to public/

set -e  # Exit on any error

echo "🚀 Building demo submodules..."

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to build a demo
build_demo() {
    local demo_name=$1
    local demo_path="demos/$demo_name"
    
    if [ -d "$demo_path" ]; then
        echo -e "${BLUE}Building $demo_name...${NC}"
        
        # Handle nested submodule structure (like orderbook-3d/CppExchangeSim)
        if [ -d "$demo_path/CppExchangeSim" ]; then
            cd "$demo_path/CppExchangeSim"
        else
            cd "$demo_path"
        fi
        
        # Install dependencies if package.json exists
        if [ -f "package.json" ]; then
            echo "Installing dependencies for $demo_name..."
            npm install
            
            # Build the project
            echo "Building $demo_name..."
            npm run build:submodule 2>/dev/null || npm run build
            
            # Copy dist files to public directory
            if [ -d "dist" ]; then
                echo "Copying built files to public directory..."
                mkdir -p "../../public/demos/$demo_name/dist"
                cp -r dist/* "../../public/demos/$demo_name/dist/"
                echo -e "${GREEN}✓ $demo_name built and copied successfully${NC}"
            else
                echo "Warning: No dist directory found for $demo_name"
            fi
        else
            echo "Warning: No package.json found for $demo_name"
        fi
        
        # Return to root
        cd - > /dev/null
    else
        echo "Warning: Demo directory $demo_path not found"
    fi
}

# Build all demos
echo "Building orderbook-3d..."
build_demo "orderbook-3d"

# You can add more demos here as they are integrated
# build_demo "orderbook-sonar"
# build_demo "volatility-glitch"
# build_demo "ai-stream-parse"

echo -e "${GREEN}🎉 All demos built successfully!${NC}" 
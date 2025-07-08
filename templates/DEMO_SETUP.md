# Demo Repository Setup Guide

This guide explains how to set up your visualization repository to work as a submodule in the WebPortfolio project.

## Prerequisites

Your demo repository should:
1. Have a `package.json` with a `build` script
2. Output built files to a `dist/` folder
3. Have the `dist/` folder committed to the repository

## Step 1: Configure Vite Base Path

In your `vite.config.js`, set the base path to match the submodule location:

```javascript
export default {
  base: '/demos/your-repo-name/dist/',
  // ... other config
}
```

## Step 2: Build and Commit Distribution Files

```bash
npm run build
git add dist/
git commit -m "build: update distribution files"
git push
```

## Step 3: Set Up Automatic Homepage Updates

1. **Create a Personal Access Token (PAT)**
   - Go to GitHub Settings → Developer settings → Personal access tokens
   - Create a new token with `repo:public_repo` scope
   - Copy the token

2. **Add the PAT to your demo repository**
   - Go to your demo repo → Settings → Secrets and variables → Actions
   - Add a new secret named `HOMEPAGE_PAT`
   - Paste your PAT as the value

3. **Add the notification workflow**
   - Create `.github/workflows/notify-homepage.yml` in your demo repository
   - Copy the contents from `templates/notify-homepage.yml` in the WebPortfolio repo
   - Commit and push

## Step 4: Verify Integration

1. Make a change to your demo repository
2. Push to main branch
3. Check the WebPortfolio Actions tab - you should see a new deployment triggered

## Package.json Example

```json
{
  "name": "your-demo-name",
  "version": "1.0.0",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  },
  "devDependencies": {
    "vite": "^5.0.0",
    "@webgpu/types": "^0.1.40"
  }
}
```

## Troubleshooting

- **Demo not loading**: Ensure your `dist/` folder is committed and pushed
- **Updates not triggering**: Check that the PAT has correct permissions
- **Build failing**: Verify the base path in `vite.config.js` matches the submodule path 
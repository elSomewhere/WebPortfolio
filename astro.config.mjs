import { defineConfig } from "astro/config";

export default defineConfig({
  outDir: "dist",
  base: "/",                  // root for GH Pages
  site: "https://estebanlanter.art",
  markdown: { shikiConfig: { theme: "dracula" } },
}); 
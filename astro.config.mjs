import { defineConfig } from "astro/config";
import tailwind from "@astrojs/tailwind";

export default defineConfig({
  integrations: [tailwind()],
  outDir: "dist",
  base: "/",                  // root for GH Pages
  site: "https://estebanlanter.art",
  markdown: { shikiConfig: { theme: "dracula" } },
}); 
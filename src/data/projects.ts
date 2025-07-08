export interface Project {
  slug: string;
  title: string;
  description: string;
  thumb: string;
}

export const series = {
  title: "Infrasonic Pulse — Triptych for the Beating Heart of the World",
  synopsis: `Markets are information-finding machines. Their rhythms—too low, too fast, too diffuse for human ears—pulse through fiber-optic veins at frequencies we can't perceive. This triptych translates that infrasonic heartbeat into visible waveforms: data made flesh, signal made ritual.`,
  works: [
    {
      slug: "image-crawler",
      title: "Crawler // Surface Noise",
      description: "A web-scale image scrape played back at 240 fps—texture beyond cognition.",
      thumb: "/demos/image-crawler/dist/cover.png"
    },
    {
      slug: "orderbook-3d",
      title: "Orderbook // Cavern Pressure",
      description: "WebGPU depth-mesh of millisecond liquidity shifts.",
      thumb: "/demos/orderbook-3d/dist/cover.png"
    },
    {
      slug: "ai-stream-parse",
      title: "Inference // Whisper Field",
      description: "An AI listens to market ticks, projecting latent grammars in real time.",
      thumb: "/demos/ai-stream-parse/dist/cover.png"
    }
  ]
} as const; 
export interface Project {
  slug: string;
  title: string;
  description: string;
  thumb: string;
}

const projects: Project[] = [
  {
    slug: 'orderbook-3d',
    title: 'Orderbook 3D',
    description: 'High-Frequency Trading Simulation with 3D Order Book Visualization and GPU-accelerated Log Viewer',
    thumb: '/demos/orderbook-3d/cover.svg'
  },
  {
    slug: 'orderbook-sonar',
    title: 'Orderbook Sonar',
    description: 'Real-time visualization of order book dynamics',
    thumb: '/demos/orderbook-sonar/cover.svg'
  },
  {
    slug: 'volatility-glitch',
    title: 'Volatility Glitch',
    description: 'GPU-accelerated market volatility patterns',
    thumb: '/demos/volatility-glitch/cover.svg'
  },
  {
    slug: 'ai-stream-parse',
    title: 'AI Stream Parse',
    description: 'Neural network parsing of market data streams',
    thumb: '/demos/ai-stream-parse/cover.svg'
  }
];

export default projects; 
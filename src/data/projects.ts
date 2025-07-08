export interface Project {
  slug: string;
  title: string;
  description: string;
  thumb: string;
}

const projects: Project[] = [
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
  }
];

export default projects; 
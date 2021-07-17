import { IBlogConfig } from '@/types';

const dbUser = 'blog';
const dbPassword = 'jxd970219';

const config: IBlogConfig = {
  host: '0.0.0.0',
  port: 9000,
  enableHTTPS: false,
  mongoUrl: `mongodb://${dbUser}:${dbPassword}@${process.env.BUILD_ENV === 'docker' ? 'blog-database' : 'localhost'}:27017/blog?authSource=admin`,
  jwtSecret: 'uN6wH5sY8iO0eM0pZ7wH2lC3oE8dU1zE'
};

export default config;

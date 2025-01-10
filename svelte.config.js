import adapter from '@sveltejs/adapter-static';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	kit: {
		// Use the static adapter to pre-render the app as static HTML, CSS, and JS files
		adapter: adapter({
			pages: 'build', // Output directory for static files
			assets: 'build', // Output directory for assets
			fallback: 'index.html', // Enables SPA fallback for client-side routing
			precompress: false // Set to true to precompress files (gzip, brotli)
		}),
		// Additional options for pre-rendering
		prerender: {
			entries: ['*'] // Pre-render all routes by default
		}
	}
};

export default config;

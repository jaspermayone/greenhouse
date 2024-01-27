import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig, loadEnv } from 'vite';
import { imagetools } from 'vite-imagetools';

export default defineConfig(({ mode }) => {
	// Load env file based on `mode` in the current working directory.
	// Set the third parameter to '' to load all env regardless of the `VITE_` prefix.
	const env = loadEnv(mode, process.cwd(), '');
	return {
		// vite config
		plugins: [sveltekit(), imagetools()],
		define: {
			__APP_ENV__: JSON.stringify(env.APP_ENV)
		},
		css: {
			preprocessorOptions: {
				scss: {
					additionalData: '@use "src/variables.scss" as *;'
				}
			}
		}
	};
});

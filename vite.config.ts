import { sveltekit } from "@sveltejs/kit/vite";
import { imagetools } from "vite-imagetools";
import type { UserConfig } from "vite";

const config: UserConfig = {
  plugins: [
    sveltekit(),
    imagetools(),
    {
      name: "configure-response-headers",
      configureServer: (server) => {
        server.middlewares.use((incomingMessage, serverReponse, next) => {
          // FIXME: Fix the cors things
          serverReponse.setHeader("Access-Control-Allow-Origin", "*");
          next();
        });
      }
    }
  ]
};

export default config;

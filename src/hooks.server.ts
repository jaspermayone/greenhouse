import { sequence } from "@sveltejs/kit/hooks";
import { SvelteKitAuth } from "@auth/sveltekit";
import { redirect, type Handle } from "@sveltejs/kit";

export const authorization = async ({ event, resolve }: any) => {
    // Protect any routes under /authenticated
    if (!event.url.pathname.startsWith("/auth")) {
      const session = await event.locals.getSession();
      if (!session) {
        throw redirect(303, "/auth");
      }
    }

    // If the request is still here, just proceed as normally
    return resolve(event);
  };
import type { PageServerLoad } from "./$types";

export const load = (async ({ locals }) => {
  try {
    const conn = locals.dbconn;

    return {
        // session: await locals.getSession(),
        // user: await locals.getUser(),
    }

  } catch (e) {
    console.log("error: ", e);
    throw e;
  }
}) satisfies PageServerLoad;

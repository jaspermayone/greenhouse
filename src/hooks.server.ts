import { sequence } from "@sveltejs/kit/hooks";

import { connectToDB } from "$lib/db";


export const dbHandle = sequence(
  async ({ event, resolve }) => {
    const dbconn = await connectToDB();
    event.locals = { dbconn };
    const response = await resolve(event);
    dbconn.release();

    return response;
  }
);
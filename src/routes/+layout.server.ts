import type { LayoutServerLoad } from "./$types";

export const load: LayoutServerLoad = async (event) => {
  // console.log("check out then events", event);
  return {
    session: await event.locals.getSession()
  };
};

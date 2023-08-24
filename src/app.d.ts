import { PoolClient } from "pg";

// See https://kit.svelte.dev/docs/types#app
// for information about these interfaces
// and what to do when importing types
declare global {
  namespace App {
    // interface Error {}
    interface Locals {
      // FIXME: Add the correct type here.
      dbconn: PoolClient;
    }
    // interface PageData {}
    // interface Platform {}
  }
}

export {};
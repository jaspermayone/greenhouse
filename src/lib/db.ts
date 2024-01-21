import pkg from 'pg';
const { Pool } = pkg;

const pool = new Pool({
  database: import.meta.env.PGDATABASE || "greenhouse",
  user: import.meta.env.PGUSER || "greenhouse_internal-site",
  host: import.meta.env.PGHOST || "localhost",
  password: import.meta.env.PGPASSWORD || "internalsupersecretsecurepassword",
  port: Number(import.meta.env.PGPORT || 5432)
});

export const connectToDB = async () => await pool.connect();

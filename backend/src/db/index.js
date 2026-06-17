const { Pool } = require("pg");
const { db } = require("../config/env");

const pool = new Pool({
  host: db.host,
  port: db.port,
  user: db.user,
  password: db.password,
  database: db.database,
  ssl: db.ssl,
});


pool.on("connect", () => {
  console.log("Connected to the PostgreSQL database successfully");
});

pool.on("error", (err) => {
  console.error("Error connecting to the PostgreSQL database", err);
});

module.exports = pool;

const {Pool} = require("pg");
console.log("SSL CONFIG ACTIVE");
console.log({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  database: process.env.DB_NAME
});
const pool = new Pool({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    ssl: {
    rejectUnauthorized: false
  }
})


pool.on("connect", ()=> {
    console.log("Connected to the postgreSQL database successfully");
})

pool.on("error", (err) => {
    console.error("Error connecting to the postgreSQL database", err);
})

module.exports = pool
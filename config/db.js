const { Pool } = require("pg");

const pool = new Pool({
    user: "postgres",
    host: "localhost",
    database: "RetailAnalyticsDB",
    password: "Waf100784@",
    port: 5432,
});

module.exports = pool;
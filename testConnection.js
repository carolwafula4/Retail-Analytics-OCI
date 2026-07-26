console.log("Starting test...");

const pool = require("./config/db");

async function testConnection() {
    try {
        const result = await pool.query("SELECT NOW()");
        console.log("✅ Connected to PostgreSQL!");
        console.log("Current Database Time:", result.rows[0].now);
    } catch (err) {
        console.error("❌ Connection Failed");
        console.error(err.message);
    } finally {
        await pool.end();
    }
}

testConnection();
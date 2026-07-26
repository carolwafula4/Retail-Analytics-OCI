const express = require("express");

const app = express();

// Middleware to read JSON requests
app.use(express.json());

// Test Route
app.get("/", (req, res) => {
    res.send("🚀 Retail Analytics API is running!");
});


const productRoutes = require("./routes/productRoutes");

app.use("/products", productRoutes);

module.exports = app;
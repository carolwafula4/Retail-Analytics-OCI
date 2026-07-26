const pool = require("../config/db");

const getAllProducts = async (req, res) => {
    try {
        const result = await pool.query(`
            SELECT *
            FROM Products
            ORDER BY StockCode
            LIMIT 20;
        `);

        res.status(200).json(result.rows);

    } catch (err) {
        console.error(err);

        res.status(500).json({
            message: "Error retrieving products"
        });
    }
};

const getProductById = async (req, res) => {
    try {
        const { id } = req.params;

        const result = await pool.query(
            `
            SELECT *
            FROM Products
            WHERE StockCode = $1;
            `,
            [id]
        );

        if (result.rows.length === 0) {
            return res.status(404).json({
                message: "Product not found"
            });
        }

        res.status(200).json(result.rows[0]);

    } catch (err) {
        console.error(err);

        res.status(500).json({
            message: "Error retrieving product"
        });
    }
};

const addProduct = async (req, res) => {
    try {
        const { stockcode, description, unitprice } = req.body;

        const result = await pool.query(
            `
            INSERT INTO Products
            (StockCode, Description, UnitPrice)
            VALUES ($1, $2, $3)
            RETURNING *;
            `,
            [stockcode, description, unitprice]
        );

        res.status(201).json({
            message: "Product added successfully",
            product: result.rows[0]
        });

    } catch (err) {
        console.error(err);

        res.status(500).json({
            message: "Error adding product"
        });
    }
};

const updateProduct = async (req, res) => {
    try {
        const { id } = req.params;
        const { description, unitprice } = req.body;

        const result = await pool.query(
            `
            UPDATE Products
            SET Description = $1,
                UnitPrice = $2
            WHERE StockCode = $3
            RETURNING *;
            `,
            [description, unitprice, id]
        );

        if (result.rows.length === 0) {
            return res.status(404).json({
                message: "Product not found"
            });
        }

        res.status(200).json({
            message: "Product updated successfully",
            product: result.rows[0]
        });

    } catch (err) {
        console.error(err);

        res.status(500).json({
            message: "Error updating product"
        });
    }
};

const deleteProduct = async (req, res) => {
    try {
        const { id } = req.params;

        const result = await pool.query(
            `
            DELETE FROM Products
            WHERE StockCode = $1
            RETURNING *;
            `,
            [id]
        );

        if (result.rows.length === 0) {
            return res.status(404).json({
                message: "Product not found"
            });
        }

        res.status(200).json({
            message: "Product deleted successfully",
            product: result.rows[0]
        });

    } catch (err) {
        console.error(err);

        res.status(500).json({
            message: "Error deleting product"
        });
    }
};
module.exports = {
    getAllProducts,
    getProductById,
    addProduct,
    updateProduct,
    deleteProduct
};
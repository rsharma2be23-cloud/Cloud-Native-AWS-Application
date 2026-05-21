const pool = require("../db");

// Get all items

const getItems = async (req, res) => {
    try {
        const result = await pool.query("SELECT * FROM items ORDER BY created_at DESC");
        res.status(200).json({
            success: true,
            count: result.rows.length,
            data: result.rows,
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Internal Server Error" });
    }
}

const createItems = async (req,res) => {
    try {
        const { name } = req.body;
        const result = await pool.query("INSERT INTO items (name) VALUES ($1) RETURNING *", [name]);
        res.status(201).json({
            success: true,
            data: result.rows[0],
        });
        
    } catch (error) {
        next(error);
    }
}

module.exports = {
    getItems,
    createItems
}
const express = require('express');
const pool = require('../db');

const router = express.Router();

router.get("/", async (req, res) => {
    try {
        await pool.query("SELECT 1");
        res.status(200).json({
            status: "OK",
            uptime: process.uptime(),
            timestamp: new Date()
        });
    } catch (error) {
        res.status(503).json({ status: "UNAVAILABLE", message: "Database is unavailable" });
    }
});

module.exports = router;

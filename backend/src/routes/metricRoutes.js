const express = require("express");

const router = express.Router();

router.get("/", (req, res) => {
    res.status(200).json({
        uptime: process.uptime(),
        memoryUsage: process.memoryUsage(),
        timestamp: new Date(),
    });
});

module.exports = router;
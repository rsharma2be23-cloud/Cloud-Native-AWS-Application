const express = require('express');
const router = express.Router();

const { getItems, createItems } = require("../controllers/itemController");
const validate = require("../middleware/validate");
const { createItemValidation } = require("../validators/itemValidator");



router.get("/getitems", getItems);
router.post("/createitems", createItemValidation, validate, createItems);


module.exports = router;    
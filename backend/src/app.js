const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const helmet = require('helmet');   
const healthRoutes = require("./routes/healthRoutes");
const itemRoutes = require("./routes/itemRoutes");
const metricRoutes = require("./routes/metricRoutes");
const errorHandler = require("./middleware/errorHandler");

const app = express();

app.use(helmet());// Add Helmet middleware for security headers
app.use(cors());// Enable CORS for all routes
app.use(express.json());
app.use(morgan("dev"));

app.use("/health", healthRoutes);
app.use("/api/items", itemRoutes);
app.use("/api/metrics", metricRoutes);

app.use(errorHandler);// Global error handling middleware

app.get("/", (req, res) => {
  res.json({
    message: "Backend API running successfully"
  });
});



module.exports = app;
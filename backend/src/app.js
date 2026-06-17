const express = require("express");
const cors = require("cors");
const morgan = require("morgan");
const helmet = require("helmet");
const healthRoutes = require("./routes/healthRoutes");
const itemRoutes = require("./routes/itemRoutes");
const metricRoutes = require("./routes/metricRoutes");
const errorHandler = require("./middleware/errorHandler");
const { nodeEnv } = require("./config/env");

const app = express();

app.use(helmet());
app.use(cors());
app.use(express.json());

if (nodeEnv !== "test") {
  app.use(morgan("dev"));
}

app.get("/", (req, res) => {
  res.json({
    message: "Backend API running successfully",
  });
});

app.use("/health", healthRoutes);
app.use("/api/items", itemRoutes);
app.use("/api/metrics", metricRoutes);

app.use(errorHandler);

module.exports = app;

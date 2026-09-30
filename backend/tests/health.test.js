const request = require("supertest");
jest.mock("../src/db", () => ({ query: jest.fn() }));

const pool = require("../src/db");
const app = require("../src/app");

describe("GET /health", () => {
  test("returns API health status", async () => {
    pool.query.mockResolvedValue({ rows: [{ "1": 1 }] });
    const response = await request(app).get("/health");

    expect(response.statusCode).toBe(200);
    expect(response.body).toEqual({
      status: "OK",
      uptime: expect.any(Number),
      timestamp: expect.any(String),
    });
  });

  test("returns unavailable when PostgreSQL cannot be reached", async () => {
    pool.query.mockRejectedValue(new Error("database unavailable"));

    const response = await request(app).get("/health");

    expect(response.statusCode).toBe(503);
    expect(response.body.status).toBe("UNAVAILABLE");
  });
});

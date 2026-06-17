const request = require("supertest");
const app = require("../src/app");

describe("GET /health", () => {
  test("returns API health status", async () => {
    const response = await request(app).get("/health");

    expect(response.statusCode).toBe(200);
    expect(response.body).toEqual({
      status: "OK",
      uptime: expect.any(Number),
      timestamp: expect.any(String),
    });
  });
});

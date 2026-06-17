const pool = require("../src/db");

jest.mock("../src/db", () => ({
  query: jest.fn(),
}));

const request = require("supertest");
const app = require("../src/app");

describe("Items API", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  test("GET /api/items/getitems returns items from PostgreSQL", async () => {
    const rows = [
      { id: 1, name: "First item" },
      { id: 2, name: "Second item" },
    ];

    pool.query.mockResolvedValue({ rows });

    const response = await request(app).get("/api/items/getitems");

    expect(response.statusCode).toBe(200);
    expect(pool.query).toHaveBeenCalledWith("SELECT * FROM items");
    expect(response.body).toEqual({
      success: true,
      count: 2,
      data: rows,
    });
  });

  test("POST /api/items/createitems creates an item", async () => {
    const item = { id: 1, name: "Created item" };

    pool.query.mockResolvedValue({ rows: [item] });

    const response = await request(app)
      .post("/api/items/createitems")
      .send({ name: "Created item" });

    expect(response.statusCode).toBe(201);
    expect(pool.query).toHaveBeenCalledWith(
      "INSERT INTO items (name) VALUES ($1) RETURNING *",
      ["Created item"]
    );
    expect(response.body).toEqual({
      success: true,
      data: item,
    });
  });

  test("POST /api/items/createitems rejects invalid input", async () => {
    const response = await request(app)
      .post("/api/items/createitems")
      .send({ name: "" });

    expect(response.statusCode).toBe(400);
    expect(response.body.success).toBe(false);
    expect(pool.query).not.toHaveBeenCalled();
  });
});

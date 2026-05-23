import api from "../services/api";

export const getItems = async () => {
  const response = await api.get("/api/items/getitems");
  return response.data.data;
};

export const createItem = async (item) => {
  const response = await api.post("/api/items/createitems", item);
  return response.data.data;
};

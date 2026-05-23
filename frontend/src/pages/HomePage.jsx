import { useEffect, useState } from "react";
import { createItem, getItems } from "../api/itemsApi";
import ItemList from "../components/ItemList";
import ItemForm from "../components/ItemForm";

function HomePage() {
  const [items, setItems] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    fetchItems();
  }, []);

  const fetchItems = async () => {
    try {
      const data = await getItems();
      setItems(data);
    } catch (err) {
      setError("Failed to fetch items");
    } finally {
      setLoading(false);
    }
  };

  const handleAddItem = async (item) => {
    try {
      const newItem = await createItem(item);

      setItems([...items, newItem]);
    } catch (err) {
      setError("Failed to create item");
    }
  };

  if (loading) {
    return <p>Loading items...</p>;
  }

  if (error) {
    return <p>{error}</p>;
  }

  return (
    <div>
      <h1>Items Dashboard</h1>

      <ItemForm onAdd={handleAddItem} />
      <ItemList items={items} />
    </div>
  );
}

export default HomePage;

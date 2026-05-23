import { useState } from "react";

function ItemForm({ onAdd }) {
  const [name, setName] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();

    const trimmedName = name.trim();

    if (!trimmedName) {
      return;
    }

    onAdd({ name: trimmedName });
    setName("");
  };

  return (
    <form onSubmit={handleSubmit}>
      <input
        type="text"
        placeholder="Enter item"
        value={name}
        onChange={(e) => setName(e.target.value)}
      />

      <button type="submit">Add Item</button>
    </form>
  );
}

export default ItemForm;

import React, { useState, useEffect } from "react";

/**
 * Smell: LARGE COMPONENT
 *
 * One component (LargeComponentDashboard) is responsible for:
 *  - layout
 *  - navigation
 *  - data fetching
 *  - filtering
 *  - basic statistics
 *  - rendering the whole page
 *
 * This is the "God Component" / Large Component smell.
 */
export function LargeComponentDashboard() {
  const [user, setUser] = useState({ name: "", role: "guest" });
  const [tab, setTab] = useState("home");
  const [items, setItems] = useState([]);
  const [filter, setFilter] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  async function fetchItems() {
    setLoading(true);
    setError(null);
    try {
      // Fake API call + business rule mixed in
      await new Promise((r) => setTimeout(r, 500));
      const data = Array.from({ length: 50 }, (_, i) => ({
        id: i,
        name: `Item ${i}`,
        price: i % 2 === 0 ? 10 : 20,
      }));
      setItems(data);
    } catch (e) {
      setError("Failed to load items");
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    fetchItems();
  }, []);

  const filteredItems = items.filter((item) =>
    item.name.toLowerCase().includes(filter.toLowerCase())
  );
  const totalPrice = filteredItems.reduce((sum, item) => sum + item.price, 0);

  function handleLogin() {
    // Fake login logic also inside this component
    setUser({ name: "Alice", role: "admin" });
  }

  return (
    <div style={{ display: "flex", minHeight: "100vh" }}>
      {/* Sidebar (navigation, user profile, etc.) */}
      <aside
        style={{
          width: 240,
          padding: 16,
          borderRight: "1px solid #ddd",
        }}
      >
        <h2>Dashboard</h2>
        <p>
          User: {user.name || "(anonymous)"} ({user.role})
        </p>
        <button onClick={handleLogin}>Fake Login</button>
        <hr />
        <nav>
          <button onClick={() => setTab("home")}>Home</button>
          <button onClick={() => setTab("stats")}>Stats</button>
          <button onClick={() => setTab("settings")}>Settings</button>
        </nav>
      </aside>

      {/* Main content */}
      <main style={{ flex: 1, padding: 16 }}>
        {tab === "home" && (
          <>
            <h3>Items</h3>
            <input
              placeholder="Filter by name"
              value={filter}
              onChange={(e) => setFilter(e.target.value)}
            />
            {loading && <p>Loading...</p>}
            {error && <p style={{ color: "red" }}>{error}</p>}
            {!loading && !error && (
              <ul>
                {filteredItems.map((item) => (
                  <li key={item.id}>
                    {item.name} – ${item.price}
                  </li>
                ))}
              </ul>
            )}
          </>
        )}

        {tab === "stats" && (
          <>
            <h3>Statistics</h3>
            <p>Total items: {filteredItems.length}</p>
            <p>Total price: {totalPrice}</p>
          </>
        )}

        {tab === "settings" && (
          <>
            <h3>Settings</h3>
            <p>(Pretend there are many form fields here...)</p>
          </>
        )}
      </main>
    </div>
  );
}

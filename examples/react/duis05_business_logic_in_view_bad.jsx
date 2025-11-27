import React, { useEffect, useState } from "react";

/**
 * Smell: BUSINESS LOGIC IN VIEW
 *
 * The component:
 *  - contains domain logic (eligibility rules),
 *  - simulates API calls,
 *  - and performs everything inside the UI layer.
 */

export function BusinessLogicInViewExample() {
  const [age, setAge] = useState("");
  const [eligible, setEligible] = useState(false);

  async function checkEligibility(age) {
    // "API" call
    await new Promise((r) => setTimeout(r, 500));
    const a = Number(age);
    // Domain rule fully embedded here
    return a >= 18 && a <= 65;
  }

  useEffect(() => {
    if (!age) return;
    checkEligibility(age).then(setEligible);
  }, [age]);

  return (
    <div style={{ padding: 16 }}>
      <h2>Business Logic in View (Bad)</h2>
      <input
        placeholder="Age"
        value={age}
        onChange={(e) => setAge(e.target.value)}
      />
      <p>{eligible ? "Eligible" : "Not eligible"}</p>
    </div>
  );
}

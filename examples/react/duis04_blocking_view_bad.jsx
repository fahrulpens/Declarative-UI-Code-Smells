import React from "react";

/**
 * Smell: BLOCKING VIEW
 *
 * Heavy synchronous work (fake "expensive" loop) executed directly
 * inside the component on every render, blocking the UI thread.
 */

function heavyComputation() {
  const result = [];
  for (let i = 0; i < 100000; i++) {
    result.push(i * i);
  }
  return result;
}

export function BlockingViewExample() {
  // ❌ Runs on every render
  const squares = heavyComputation();

  return (
    <div>
      <h2>Blocking View Example</h2>
      <p>This may freeze the tab on slower machines.</p>
      <ul style={{ maxHeight: 200, overflow: "auto" }}>
        {squares.slice(0, 200).map((n) => (
          <li key={n}>{n}</li>
        ))}
      </ul>
    </div>
  );
}

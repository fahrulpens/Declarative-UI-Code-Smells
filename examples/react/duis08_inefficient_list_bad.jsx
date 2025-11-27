import React from "react";

/**
 * Smell: INEFFICIENT LIST
 *
 * Renders thousands of DOM nodes at once, without virtualization.
 * For large lists, this kills performance.
 */

export function InefficientListExample() {
  const items = Array.from({ length: 5000 }, (_, i) => `Item ${i}`);

  return (
    <div style={{ padding: 16 }}>
      <h2>Inefficient List Example</h2>
      <div style={{ height: 300, overflow: "auto", border: "1px solid #ddd" }}>
        {/* All items rendered at once */}
        {items.map((item) => (
          <div key={item} style={{ padding: 4 }}>
            {item}
          </div>
        ))}
      </div>
    </div>
  );
}

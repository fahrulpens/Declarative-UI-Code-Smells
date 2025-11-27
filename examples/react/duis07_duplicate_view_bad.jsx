import React from "react";

/**
 * Smell: DUPLICATE VIEW
 *
 * Three user "cards" with almost identical structure are copy–pasted,
 * instead of extracting a reusable <UserCard /> component.
 */

export function DuplicateViewExample() {
  return (
    <div style={{ padding: 16 }}>
      <h2>Duplicate View Example</h2>

      {/* Card #1 */}
      <div
        style={{
          border: "1px solid #ddd",
          borderRadius: 4,
          padding: 8,
          marginBottom: 8,
        }}
      >
        <strong>Alice</strong>
        <div>alice@example.com</div>
      </div>

      {/* Card #2 – copy-paste layout */}
      <div
        style={{
          border: "1px solid #ddd",
          borderRadius: 4,
          padding: 8,
          marginBottom: 8,
        }}
      >
        <strong>Bob</strong>
        <div>bob@example.com</div>
      </div>

      {/* Card #3 – again copy-paste */}
      <div
        style={{
          border: "1px solid #ddd",
          borderRadius: 4,
          padding: 8,
          marginBottom: 8,
        }}
      >
        <strong>Charlie</strong>
        <div>charlie@example.com</div>
      </div>
    </div>
  );
}

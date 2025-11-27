import React, { useEffect, useState } from "react";

/**
 * Smell: MISUSED EFFECTS
 *
 * 1) useEffect used for simple derived state that could be computed inline.
 * 2) Effect sets state every render (no dependency array), potentially causing
 *    unnecessary extra renders.
 */

export function MisusedEffectsExample() {
  const [value, setValue] = useState(0);
  const [double, setDouble] = useState(0);

  // ❌ Misused effect: runs on EVERY render (no dependency array) and
  // sets state that could be derived directly in render.
  useEffect(() => {
    setDouble(value * 2);
    console.log("Effect ran to recompute double");
  });

  return (
    <div style={{ padding: 16 }}>
      <h2>Misused Effects Example</h2>
      <p>Value: {value}</p>
      <p>Double (stored in state via effect): {double}</p>
      <button onClick={() => setValue((v) => v + 1)}>Increment</button>
    </div>
  );
}

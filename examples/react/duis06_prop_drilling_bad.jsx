import React from "react";

/**
 * Smell: PROP DRILLING
 *
 * A value (themeColor) is passed through multiple intermediate components
 * that do not need it, only to reach a deep child.
 */

export function PropDrillingRoot() {
  return (
    <div style={{ padding: 16 }}>
      <h2>Prop Drilling Example</h2>
      <LevelOne themeColor="blue" />
    </div>
  );
}

function LevelOne({ themeColor }) {
  // Does not use themeColor, just forwards
  return <LevelTwo themeColor={themeColor} />;
}

function LevelTwo({ themeColor }) {
  // Does not use themeColor, just forwards
  return <LevelThree themeColor={themeColor} />;
}

function LevelThree({ themeColor }) {
  // Finally used here
  return <span style={{ color: themeColor }}>Deep child using themeColor</span>;
}

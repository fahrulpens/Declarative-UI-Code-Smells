import React, { useState } from "react";

/**
 * DUIS-03 – Mismanaged UI State in View (Mutable View)
 *
 * This file shows TWO smells:
 *
 * 1) Mutable View:
 *    - The child component receives a list `items` from the parent via props.
 *    - Instead of treating it as read-only and asking the parent to update it,
 *      the child directly mutates `props.items` (push / pop).
 *
 * 2) Misuse of setState in render():
 *    - The child calls this.setState() inside render() to "initialize"
 *      some derived state, guarded by a flag to avoid infinite loops.
 *    - This couples rendering with state mutation and is considered
 *      an anti-pattern in React.
 */

// Parent holds the items "logically", but does not perform updates itself.
// The child takes over mutation responsibility (smell).
export function MutableViewDemoParent() {
  const [items] = useState(["Item 1", "Item 2"]); // parent never updates

  return (
    <div style={{ padding: 16 }}>
      <h2>Mutable View Demo (Bad)</h2>
      <MutableViewBadChild items={items} />
      <pre>Parent still thinks items is: {JSON.stringify(items, null, 2)}</pre>
    </div>
  );
}

class MutableViewBadChild extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      renderInitialized: false,
      statusMessage: "Not initialized",
      localRenderVersion: 0, // only used to force re-render
    };
  }

  // ❌ Smell 1: Mutating props (external shared state) inside the view
  handleAdd = () => {
    // Directly mutating this.props.items (array from parent).
    this.props.items.push(`Item ${this.props.items.length + 1}`);

    // Local state used only to force this component to re-render
    // so the mutated props array is visible in the UI.
    this.setState((prev) => ({
      localRenderVersion: prev.localRenderVersion + 1,
    }));
  };

  handleRemoveLast = () => {
    if (this.props.items.length > 0) {
      this.props.items.pop(); // ❌ More mutation of external shared collection
      this.setState((prev) => ({
        localRenderVersion: prev.localRenderVersion + 1,
      }));
    }
  };

  render() {
    const { items } = this.props;
    const { renderInitialized, statusMessage } = this.state;

    // ❌ Smell 2: Misuse of setState() in render()
    //
    // Here we "initialize" some derived state the first time render() sees
    // that items.length >= 3. Even though we guard with a flag to avoid
    // infinite loops, calling setState() inside render() is an anti-pattern.
    if (!renderInitialized && items.length >= 3) {
      this.setState({
        renderInitialized: true,
        statusMessage: "Initialized from render() when items.length >= 3",
      });
    }

    return (
      <div style={{ border: "1px solid #ccc", padding: 8, marginBottom: 8 }}>
        <p style={{ fontStyle: "italic" }}>{statusMessage}</p>

        <div style={{ marginBottom: 8 }}>
          <button onClick={this.handleAdd}>Add item</button>{" "}
          <button onClick={this.handleRemoveLast}>Remove last</button>
        </div>

        <ul>
          {items.map((item, index) => (
            <li key={index}>{item}</li>
          ))}
        </ul>
      </div>
    );
  }
}

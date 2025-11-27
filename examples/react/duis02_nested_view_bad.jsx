import React from "react";

/**
 * Smell: NESTED VIEW
 *
 * Deeply nested JSX structure for a simple layout.
 * Many <div>/<section>/<article> wrappers that don't add value.
 */
export function NestedViewExample() {
  return (
    <div style={{ padding: 8 }}>
      <div style={{ margin: 8 }}>
        <div>
          <section>
            <article>
              <div>
                <div>
                  <div>
                    <div>
                      <span>
                        <strong>Deeply nested text</strong>
                      </span>
                    </div>
                  </div>
                </div>
              </div>
            </article>
          </section>
        </div>
      </div>
    </div>
  );
}

import 'package:flutter/material.dart';

/// DUIS-02 – Deeply Nested View Tree (Nested View)
/// - Many nested Containers/Rows/Columns for a simple text.
class NestedLayoutExample extends StatelessWidget {
  const NestedLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(4),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      child: Row(
                                        children: const [
                                          Expanded(
                                            child: Text(
                                              "Deeply nested text",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

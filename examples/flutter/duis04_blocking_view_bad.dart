import 'package:flutter/material.dart';

/// DUIS-04 – Blocking / Expensive View Declaration
/// - Heavy computation runs every build and blocks UI.
class ExpensiveViewExample extends StatelessWidget {
  const ExpensiveViewExample({super.key});

  List<int> _heavyComputation() {
    final result = <int>[];
    for (var i = 0; i < 100000; i++) {
      result.add(i * i);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final squares = _heavyComputation(); // executed on every build
    return Scaffold(
      appBar: AppBar(title: const Text("Expensive View")),
      body: ListView.builder(
        itemCount: squares.length,
        itemBuilder: (_, i) => ListTile(title: Text("${squares[i]}")),
      ),
    );
  }
}

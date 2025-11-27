import 'package:flutter/material.dart';

/// DUIS-08 – Inefficient Rendering & Lists
/// - All items built eagerly in a Column; no lazy list.
class InefficientListExample extends StatelessWidget {
  const InefficientListExample({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(5000, (i) => "Item $i");

    return Scaffold(
      appBar: AppBar(title: const Text("Inefficient List")),
      body: SingleChildScrollView(
        child: Column(
          children: items
              .map(
                (item) => ListTile(title: Text(item)),
              )
              .toList(),
        ),
      ),
    );
  }
}

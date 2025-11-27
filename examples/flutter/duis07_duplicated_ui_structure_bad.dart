import 'package:flutter/material.dart';

/// DUIS-07 – Duplicated UI Structure
/// - Card layout copy-pasted instead of reusing a widget.
class DuplicatedCardUsage extends StatelessWidget {
  const DuplicatedCardUsage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        // Card #1
        Card(
          child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text("Alice"),
            subtitle: Text("alice@example.com"),
          ),
        ),
        // Card #2 – same structure copy-pasted
        Card(
          child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text("Bob"),
            subtitle: Text("bob@example.com"),
          ),
        ),
        // Card #3 – again copy-paste
        Card(
          child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text("Charlie"),
            subtitle: Text("charlie@example.com"),
          ),
        ),
      ],
    );
  }
}

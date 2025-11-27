import 'package:flutter/material.dart';

/// DUIS-03 – Mismanaged UI State in View (Mutable View)
///
/// Smell 1 (Mutable View):
/// - The view receives a list of items from its parent (widget parameter).
/// - Instead of treating it as read-only and notifying the parent via a callback
///   or ViewModel, the view *directly mutates* that shared collection.
///
/// Smell 2 (Misuse of setState in build()):
/// - The widget calls setState() inside build() to "initialize" derived state.
/// - This couples rendering with state mutation and can easily cause
///   repeated rebuilds / subtle bugs.
class MutableViewExample extends StatefulWidget {
  /// Shared mutable collection coming from parent / higher layer.
  final List<String> items;

  const MutableViewExample({super.key, required this.items});

  @override
  State<MutableViewExample> createState() => _MutableViewExampleState();
}

class _MutableViewExampleState extends State<MutableViewExample> {
  bool _initializedInBuild = false;
  String _statusMessage = "Not initialized";

  void _addItem() {
    // ❌ Smell: the view directly mutates a shared external collection.
    // In a cleaner architecture, the view would call a callback or delegate
    // to a controller/ViewModel instead of editing the list itself.
    widget.items.add("Item ${widget.items.length + 1}");
    setState(() {}); // forces rebuild after mutation
  }

  void _removeLast() {
    if (widget.items.isNotEmpty) {
      // ❌ Same smell: removal from parent-owned collection
      widget.items.removeLast();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // ❌ Smell: misuse of setState() inside build()
    //
    // Here we "initialize" some derived state the first time build() runs.
    // Even though we guard it with a flag to avoid infinite loops, putting
    // setState() in build() is still considered an anti-pattern.
    if (!_initializedInBuild && widget.items.length >= 3) {
      _initializedInBuild = true; // prevent infinite loop
      setState(() {
        _statusMessage = "Initialized from build() when items >= 3";
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mutable View Example"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(24),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              _statusMessage,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _addItem,
                child: const Text("Add item"),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: _removeLast,
                child: const Text("Remove last"),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (_, i) => ListTile(
                title: Text(widget.items[i]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// DUIS-09 – Misuse of Effects / Lifecycle APIs
/// - Scheduling a post-frame callback on every build → repeated work.
class MisusedEffectsExample extends StatelessWidget {
  const MisusedEffectsExample({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // This will be scheduled every time build runs
      debugPrint("Post-frame callback running");
    });

    return const Scaffold(
      body: Center(child: Text("Misused Effects Example")),
    );
  }
}

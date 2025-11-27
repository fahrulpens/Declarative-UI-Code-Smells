import 'package:flutter/material.dart';

/// DUIS-05 – Presentation–Logic Coupling
/// - API call + domain rule directly inside view logic.
class PresentationLogicInViewExample extends StatefulWidget {
  const PresentationLogicInViewExample({super.key});

  @override
  State<PresentationLogicInViewExample> createState() =>
      _PresentationLogicInViewExampleState();
}

class _PresentationLogicInViewExampleState
    extends State<PresentationLogicInViewExample> {
  bool _eligible = false;
  int _age = 0;

  Future<bool> _checkEligibilityFromServer(int age) async {
    await Future.delayed(const Duration(seconds: 1)); // fake API
    // domain rule + “API” here
    return age >= 18 && age <= 60;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Eligibility")),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Age"),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              _age = int.tryParse(value) ?? 0;
              _checkEligibilityFromServer(_age).then((result) {
                setState(() => _eligible = result);
              });
            },
          ),
          Text(_eligible ? "Eligible" : "Not eligible"),
        ],
      ),
    );
  }
}

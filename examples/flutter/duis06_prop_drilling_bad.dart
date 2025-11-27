import 'package:flutter/material.dart';

/// DUIS-06 – Prop Drilling / Poor Data Flow
/// - themeColor is passed through intermediate widgets that don't use it.
class PropDrillingRoot extends StatelessWidget {
  const PropDrillingRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LevelOne(themeColor: Colors.blue),
    );
  }
}

class LevelOne extends StatelessWidget {
  final Color themeColor;
  const LevelOne({super.key, required this.themeColor});

  @override
  Widget build(BuildContext context) {
    return LevelTwo(themeColor: themeColor); // just forwards
  }
}

class LevelTwo extends StatelessWidget {
  final Color themeColor;
  const LevelTwo({super.key, required this.themeColor});

  @override
  Widget build(BuildContext context) {
    return LevelThree(themeColor: themeColor); // just forwards
  }
}

class LevelThree extends StatelessWidget {
  final Color themeColor;
  const LevelThree({super.key, required this.themeColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Deep child",
        style: TextStyle(color: themeColor),
      ),
    );
  }
}

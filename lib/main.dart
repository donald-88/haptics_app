import 'package:flutter/material.dart';
import 'package:haptics_app/screens/pitch.dart';

void main() {
  runApp(const HapticsApp());
}

class HapticsApp extends StatelessWidget {
  const HapticsApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PitchSide(),
    );
  }
}

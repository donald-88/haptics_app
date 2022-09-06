import 'package:flutter/material.dart';
import 'package:haptics_app/components/player.dart';

class PitchSide extends StatefulWidget {
  const PitchSide({Key? key}) : super(key: key);

  @override
  State<PitchSide> createState() => _PitchSideState();
}

class _PitchSideState extends State<PitchSide> {
  Player playerA = Player(
    color: const Color.fromARGB(255, 15, 116, 198),
    borderColor: Colors.blueAccent,
    initLeft: 0,
    initTop: 0,
  );

  Player playerB = Player(
    color: Colors.red,
    borderColor: Colors.redAccent,
    initLeft: 100,
    initTop: 100,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [playerA, playerB],
      ),
    );
  }
}

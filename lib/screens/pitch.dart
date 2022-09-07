import 'package:flutter/material.dart';
import 'package:haptics_app/components/pitchPainter.dart';
import 'package:haptics_app/components/player.dart';

class PitchSide extends StatefulWidget {
  const PitchSide({Key? key}) : super(key: key);

  @override
  State<PitchSide> createState() => _PitchSideState();
}

class _PitchSideState extends State<PitchSide> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Player playerA = Player(
      color: const Color.fromARGB(255, 15, 116, 198),
      borderColor: Colors.blueAccent,
      initLeft: 50,
      initTop: 70,
    );

    Player playerA2 = Player(
      color: const Color.fromARGB(255, 15, 116, 198),
      borderColor: Colors.blueAccent,
      initLeft: 150,
      initTop: 70,
    );

    Player playerA3 = Player(
      color: const Color.fromARGB(255, 15, 116, 198),
      borderColor: Colors.blueAccent,
      initLeft: 250,
      initTop: 70,
    );

    Player playerB = Player(
      color: Colors.red,
      borderColor: Colors.redAccent,
      initLeft: width - 100,
      initTop: height - 100,
    );

    return SafeArea(
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: Colors.green,
              height: height - 50,
              width: width - 50,
              child: CustomPaint(painter: PitchPainter()),
            ),
            playerA,
            playerA2,
            playerA3,
            playerB
          ],
        ),
      ),
    );
  }
}

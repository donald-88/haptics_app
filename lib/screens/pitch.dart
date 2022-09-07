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

    print(width);
    print(height);

    Player playerA = Player(
      color: const Color.fromARGB(255, 15, 116, 198),
      borderColor: Colors.blueAccent,
      initLeft: 0,
      initTop: 0,
    );

    Player playerA2 = Player(
      color: const Color.fromARGB(255, 15, 116, 198),
      borderColor: Colors.blueAccent,
      initLeft: (width / 3),
      initTop: 70,
    );

    Player playerA3 = Player(
      color: const Color.fromARGB(255, 15, 116, 198),
      borderColor: Colors.blueAccent,
      initLeft: (width / 2) + 20,
      initTop: 70,
    );

    Player playerA4 = Player(
      color: const Color.fromARGB(255, 15, 116, 198),
      borderColor: Colors.blueAccent,
      initLeft: width - 100,
      initTop: 70,
    );

    Player playerA5 = Player(
      color: const Color.fromARGB(255, 15, 116, 198),
      borderColor: Colors.blueAccent,
      initLeft: width / 2,
      initTop: 150,
    );

    Player playerA6 = Player(
      color: const Color.fromARGB(255, 15, 116, 198),
      borderColor: Colors.blueAccent,
      initLeft: (width / 2) - 100,
      initTop: 200,
    );

    Player playerA7 = Player(
      color: const Color.fromARGB(255, 15, 116, 198),
      borderColor: Colors.blueAccent,
      initLeft: (width / 2) + 100,
      initTop: 200,
    );

    Player playerA8 = Player(
      color: const Color.fromARGB(255, 15, 116, 198),
      borderColor: Colors.blueAccent,
      initLeft: (width / 2) - 30,
      initTop: 250,
    );

    Player playerA9 = Player(
      color: const Color.fromARGB(255, 15, 116, 198),
      borderColor: Colors.blueAccent,
      initLeft: (width / 2) - 180,
      initTop: 250,
    );

    Player playerA10 = Player(
      color: const Color.fromARGB(255, 15, 116, 198),
      borderColor: Colors.blueAccent,
      initLeft: (width / 2) + 130,
      initTop: 250,
    );

    Player playerB = Player(
      color: Colors.red,
      borderColor: Colors.redAccent,
      initLeft: width - 100,
      initTop: height - 100,
    );

    return SafeArea(
      child: Center(
        child: Stack(
          children: [
            Container(
              color: const Color.fromARGB(255, 62, 194, 152),
              height: height,
              width: width,
              child: CustomPaint(painter: PitchPainter()),
            ),
            playerA,
            playerB
          ],
        ),
      ),
    );
  }
}

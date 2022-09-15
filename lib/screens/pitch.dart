import 'package:flutter/material.dart';
import 'package:haptics_app/components/linkPainter.dart';
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

    Player gkA = Player(
      position: "GK",
      color: Colors.red,
      borderColor: Colors.redAccent,
      initLeft: (width * 0.5) - 25,
      initTop: 10,
    );

    Player cbA1 = Player(
      position: "CB",
      color: Colors.red,
      borderColor: Colors.redAccent,
      initLeft: (width * 0.5) + 50,
      initTop: (height * 0.167),
    );

    Player cbA2 = Player(
      position: "CB",
      color: Colors.red,
      borderColor: Colors.redAccent,
      initLeft: (width * 0.5) - 100,
      initTop: (height * 0.167),
    );

    Player lbA = Player(
      position: "LB",
      color: Colors.red,
      borderColor: Colors.redAccent,
      initLeft: width - 100,
      initTop: height * 0.25,
    );

    Player rbA = Player(
      position: "RB",
      color: Colors.red,
      borderColor: Colors.redAccent,
      initLeft: 50,
      initTop: height * 0.25,
    );

    Player cdmA = Player(
      position: "CDM",
      color: Colors.red,
      borderColor: Colors.redAccent,
      initLeft: (width * 0.5) - 25,
      initTop: height / 3,
    );

    Player cmA1 = Player(
      position: "CM",
      color: Colors.red,
      borderColor: Colors.redAccent,
      initLeft: (width * 0.5) + 50,
      initTop: height * 0.5,
    );

    Player cmA2 = Player(
      position: "CM",
      color: Colors.red,
      borderColor: Colors.redAccent,
      initLeft: (width * 0.5) - 100,
      initTop: height * 0.5,
    );

    Player rwA = Player(
      position: "RW",
      color: Colors.red,
      borderColor: Colors.redAccent,
      initLeft: 50,
      initTop: height * 0.65,
    );

    Player lwA = Player(
      position: "LW",
      color: Colors.red,
      borderColor: Colors.redAccent,
      initLeft: width - 100,
      initTop: height * 0.65,
    );

    Player cfA = Player(
      position: "CF",
      color: Colors.red,
      borderColor: Colors.redAccent,
      initLeft: (width * 0.5) - 25,
      initTop: height * 0.75,
    );

    // Player gkB = Player(
    //   color: Colors.red,
    //   borderColor: Colors.redAccent,
    //   initLeft: (width * 0.5) - 25,
    //   initTop: height - 60,
    // );

    // Player cbB1 = Player(
    //   color: Colors.red,
    //   borderColor: Colors.redAccent,
    //   initLeft: (width * 0.5) + 50,
    //   initTop: (height * 0.75),
    // );

    // Player cbB2 = Player(
    //   color: Colors.red,
    //   borderColor: Colors.redAccent,
    //   initLeft: (width * 0.5) - 100,
    //   initTop: (height * 0.75),
    // );

    // Player lbB = Player(
    //   color: Colors.red,
    //   borderColor: Colors.redAccent,
    //   initLeft: width - 100,
    //   initTop: (height * 0.65) + 50,
    // );

    // Player rbB = Player(
    //   color: Colors.red,
    //   borderColor: Colors.redAccent,
    //   initLeft: 50,
    //   initTop: (height * 0.65) + 50,
    // );

    return SafeArea(
      child: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/pitch.png'))),
              height: height,
              width: width,
              child: CustomPaint(
                painter: PitchPainter(),
                foregroundPainter: LinkPainter(),
              ),
            ),
            gkA,
            cbA1,
            cbA2,
            lbA,
            rbA,
            cdmA,
            cmA1,
            cmA2,
            lwA,
            rwA,
            cfA,
            // cbB1,
            // cbB2,
            // rbB,
            // lbB,
            // gkB
          ],
        ),
      ),
    );
  }
}

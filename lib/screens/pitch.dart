import 'package:flutter/material.dart';
import 'package:haptics_app/components/linkPainter.dart';
import 'package:haptics_app/components/pitchPainter.dart';
import 'package:haptics_app/components/player.dart';
import 'package:web_socket_channel/io.dart';

class PitchSide extends StatefulWidget {
  const PitchSide({Key? key}) : super(key: key);

  @override
  State<PitchSide> createState() => _PitchSideState();
}

class _PitchSideState extends State<PitchSide> {
  final channel =
      IOWebSocketChannel.connect(Uri.parse('ws://192.168.2.55:8080'));

  bool tapped = false;

  @override
  void initState() {
    super.initState();
    streamListener();
  }

  streamListener() {
    channel.stream.listen((message) {
      print(message);
    });
  }

  void updateLeft(bool newValue) {
    if (tapped) {
      sendWebSocketMessage("PIN25_ON");
      sendWebSocketMessage("PIN21_OFF");
    } else {
      sendWebSocketMessage("PIN25_OFF");
    }
  }

  void updateRight(bool newValue) {
    if (tapped) {
      sendWebSocketMessage("PIN21_ON");
      sendWebSocketMessage("PIN25_OFF");
    } else {
      sendWebSocketMessage("PIN21_OFF");
    }
  }

  void updateTop(bool newValue) {
    if (tapped) {
      sendWebSocketMessage("PIN27_ON");
      sendWebSocketMessage("PIN23_OFF");
    } else {
      sendWebSocketMessage("PIN27_OFF");
    }
  }

  void updateBottom(bool newValue) {
    if (tapped) {
      sendWebSocketMessage("PIN23_ON");
      sendWebSocketMessage("PIN27_OFF");
    } else {
      sendWebSocketMessage("PIN23_OFF");
    }
  }

  void updateTapped(bool newValue) {
    tapped = newValue;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Player gkA = Player(
      position: "GK",
      color: Colors.red,
      borderColor: Colors.redAccent,
      initLeft: (width * 0.5) - 25,
      initTop: 10,
      left: updateLeft,
      right: updateRight,
      top: updateTop,
      bottom: updateBottom,
      tapped: updateTapped,
    );

    Player cbA1 = Player(
        position: "CB",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: (width * 0.5) + 50,
        initTop: (height * 0.167),
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player cbA2 = Player(
        position: "CB",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: (width * 0.5) - 100,
        initTop: (height * 0.167),
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player lbA = Player(
        position: "LB",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: width - 100,
        initTop: height * 0.25,
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player rbA = Player(
        position: "RB",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: 50,
        initTop: height * 0.25,
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player cdmA = Player(
        position: "CDM",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: (width * 0.5) - 25,
        initTop: height / 3,
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player cmA1 = Player(
        position: "CM",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: (width * 0.5) + 50,
        initTop: height * 0.5,
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player cmA2 = Player(
        position: "CM",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: (width * 0.5) - 100,
        initTop: height * 0.5,
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player rwA = Player(
        position: "RW",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: 50,
        initTop: height * 0.65,
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player lwA = Player(
        position: "LW",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: width - 100,
        initTop: height * 0.65,
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player cfA = Player(
        position: "CF",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: (width * 0.5) - 25,
        initTop: height * 0.75,
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    return SafeArea(
      child: Center(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/pitch.jpg'))),
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
          ],
        ),
      ),
    );
  }

  void sendWebSocketMessage(String message) {
    channel.sink.add(message);
  }
}

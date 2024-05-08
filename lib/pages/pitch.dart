import 'dart:math';
import 'package:flutter/material.dart';
import 'package:haptics_app/widgets/linkPainter.dart';
import 'package:haptics_app/widgets/pitchPainter.dart';
import 'package:haptics_app/widgets/player.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class PitchSide extends StatefulWidget {
  const PitchSide({Key? key}) : super(key: key);

  @override
  State<PitchSide> createState() => _PitchSideState();
}

class _PitchSideState extends State<PitchSide> {
  final channel = WebSocketChannel.connect(Uri.parse('ws://192.168.1.81:8080'));

  bool tapped = false;
  bool backVib = false;
  bool frontVib = false;
  bool rhsVib = false;
  bool lhsVib = false;

  double distance1 = 0.0; //for storing distance

  String receivedData = ''; //for esp32

  double distanceAnchor1 = 0.0;
  double distanceAnchor2 = 0.0;

  double x = 0;
  double y = 0;

  void checkAndExtractAnchorDistance(String data) {
    if (data.startsWith('ANCHOR')) {
      //splitting message into anchor and distance
      final parts = data.split(":");

      if (parts.length == 2) {
        final anchor = parts[0];
        final distance = double.tryParse(parts[1]);

        if (anchor == "ANCHOR132" && distance != null) {
          distanceAnchor1 = distance;
        }
        if (anchor == "ANCHOR6019" && distance != null) {
          distanceAnchor2 = distance;
        }
        if (distance != null) {
          distance1 = distance;
          receivedData = 'Received: Anchor $anchor, Distance: $distance1';
        }
      }
    }

    tagPos(distanceAnchor1, distanceAnchor2, 2.00);
  }

  void updateLeft() {
    if (tapped) {
      sendWebSocketMessage("PIN25_ON");
      sendWebSocketMessage("PIN21_OFF");
    } else {
      sendWebSocketMessage("PIN25_OFF");
    }
  }

  void updateRight() {
    if (tapped) {
      sendWebSocketMessage("PIN21_ON");
      sendWebSocketMessage("PIN25_OFF");
    } else {
      sendWebSocketMessage("PIN21_OFF");
    }
  }

  void updateTop() {
    if (tapped) {
      sendWebSocketMessage("PIN27_ON");
      sendWebSocketMessage("PIN23_OFF");
    } else {
      sendWebSocketMessage("PIN27_OFF");
    }
  }

  void updateBottom() {
    if (tapped) {
      sendWebSocketMessage("PIN23_ON");
      sendWebSocketMessage("PIN27_OFF");
    } else {
      sendWebSocketMessage("PIN23_OFF");
    }
  }

  void updateTapped(bool startVibration) {
    tapped = startVibration;
  }

  void tagPos(a, b, c) {
    double cosA = ((b * b) + (c * c) - (a * a)) / (2 * b * c);
    x = b * cosA;
    y = b * sqrt(1 - pow(cosA, 2));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
            StreamBuilder(
                stream: channel.stream,
                builder: (context, snapshot) {
                  //if loading, show loading widget
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: AlertDialog(
                      contentPadding: EdgeInsets.all(32),
                      content: Row(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(width: 32),
                          Text(
                            'Waiting for response.',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ));
                  }

                  //if there's an error, show error widget
                  if (snapshot.hasError) {
                    return Center(
                        child: AlertDialog(
                      title: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Error'),
                        ],
                      ),
                      contentPadding: const EdgeInsets.all(32),
                      content: Text(snapshot.error.toString()),
                    ));
                  }

                  //if there's no data, show no player
                  if (!snapshot.hasData) {
                    return const Center(
                        child: AlertDialog(
                      contentPadding: EdgeInsets.all(32),
                      content: Text('No data to show'),
                    ));
                  }

                  //if there's data display the data
                  // checkAndExtractAnchorDistance(snapshot.data.toString());
                  print(snapshot.data);
                  return Player(
                      position: 'CF',
                      initLeft: (width * (x * 0.94)) + 400,
                      initTop: height * (y * 0.94) + 900,
                      left: updateLeft,
                      right: updateRight,
                      top: updateTop,
                      bottom: updateBottom,
                      tapped: updateTapped);
                }),
          ],
        ),
      ),
    );
  }

  void sendWebSocketMessage(String message) {
    channel.sink.add(message);
  }
}

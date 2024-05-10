import 'dart:math';
import 'package:flutter/material.dart';
import 'package:haptics_app/widgets/player.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../utils/pointModel.dart';

class TestField extends StatefulWidget {
  const TestField({super.key});

  @override
  State<TestField> createState() => _TestFieldState();
}

class _TestFieldState extends State<TestField> {
  final channel = WebSocketChannel.connect(Uri.parse('ws://192.168.1.81:8080'));

  bool tapped = false;

  void updateTapped(bool startVibration) {
    tapped = startVibration;
  }

  Point trilaterate(
      List<Point> anchors, List<double> distances, Point initialGuess) {
    if (anchors.length != distances.length) {
      throw Exception('Number of anchors and distances must be equal');
    }

    double x = initialGuess.x, y = initialGuess.y, z = initialGuess.z;
    double error = double.maxFinite;
    const maxIterations = 1000;
    const epsilon = 0.001;

    for (int i = 0; i < maxIterations && error > epsilon; i++) {
      double dx = 0, dy = 0, dz = 0;

      for (int j = 0; j < anchors.length; j++) {
        final anchor = anchors[j];
        final distance = distances[j];
        final calculated = sqrt(
            pow(x - anchor.x, 2) + pow(y - anchor.y, 2) + pow(z - anchor.z, 2));
        final residual = calculated - distance;

        dx += residual * (x - anchor.x) / calculated;
        dy += residual * (y - anchor.y) / calculated;
        dz += residual * (z - anchor.z) / calculated;
      }

      x -= 0.01 * dx;
      y -= 0.01 * dy;
      z -= 0.01 * dz;

      error = sqrt(pow(dx, 2) + pow(dy, 2) + pow(dz, 2));
    }

    return Point(x, y, z);
  }

  final anchors = [
    Point(0, 0, 0), // Anchor 1
    Point(4, 0, 0), // Anchor 2
    Point(4, 4, 0), // Anchor 3
    Point(0, 4, 0), // Anchor 4
  ];

  final distances = [5.0, 5.0, 5.0, 5.0];

  final initialGuess = Point(2, 2, 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03b56e),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 700,
                  width: 700,
                  decoration: const BoxDecoration(color: Colors.orange),
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

                      final position =
                          trilaterate(anchors, distances, initialGuess);
                      return Player(
                          position: 'TP',
                          initLeft: position.x,
                          initTop: position.y,
                          left: () {},
                          right: () {},
                          top: () {},
                          bottom: () {},
                          tapped: updateTapped);
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

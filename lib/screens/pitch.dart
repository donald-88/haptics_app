import 'dart:math';

import 'package:flutter/material.dart';

class PitchSide extends StatefulWidget {
  const PitchSide({Key? key}) : super(key: key);

  @override
  State<PitchSide> createState() => _PitchSideState();
}

class _PitchSideState extends State<PitchSide> {
  double _left = 0.0;
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _left = max(0, _left + details.delta.dx);
                  _top = max(0, _top + details.delta.dy);
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
              ),
            ),
          )
        ],
      ),
    );
  }
}

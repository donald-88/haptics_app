import 'dart:math';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  final String position;
  final Color color;
  final Color borderColor;
  double initLeft;
  double initTop;
  Player(
      {required this.position,
      required this.color,
      required this.borderColor,
      required this.initLeft,
      required this.initTop});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final GlobalKey _keyPos = GlobalKey();
  _getPositions() {
    final RenderBox renderBoxRed =
        _keyPos.currentContext?.findRenderObject() as RenderBox;
    final positionRed = renderBoxRed.localToGlobal(Offset.zero);
    print("POSITION of Red: $positionRed ");
  }

  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.initTop - 33,
      left: widget.initLeft - 33,
      child: GestureDetector(
        onPanUpdate: (details) {
          if (tapped == true) {
            setState(() {
              widget.initLeft = max(0, widget.initLeft + details.delta.dx);
              widget.initTop = max(0, widget.initTop + details.delta.dy);
            });
          }
        },
        onTap: () {
          _getPositions();
          setState(() {
            tapped = !tapped;
          });
        },
        child: AvatarGlow(
          animate: tapped,
          endRadius: 60,
          glowColor: widget.borderColor,
          duration: const Duration(milliseconds: 1000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          child: Container(
            key: _keyPos,
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                boxShadow: [
                  for (double i = 1; i < 5; i++)
                    BoxShadow(
                        color: Colors.redAccent,
                        blurRadius: 3 * i,
                        blurStyle: tapped ? BlurStyle.normal : BlurStyle.inner)
                ],
                color: widget.color,
                borderRadius: const BorderRadius.all(Radius.circular(50))),
            child: Center(
              child: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                    color: widget.borderColor,
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                child: Center(
                  child: DefaultTextStyle(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      child: Text(widget.position)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

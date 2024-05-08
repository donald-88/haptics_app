import 'dart:math';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Player extends StatefulWidget {
  VoidCallback left;
  VoidCallback right;
  VoidCallback top;
  VoidCallback bottom;
  ValueChanged<bool> tapped;
  final String position;
  double initLeft;
  double initTop;
  Player(
      {super.key,
      required this.position,
      required this.initLeft,
      required this.initTop,
      required this.left,
      required this.right,
      required this.top,
      required this.bottom,
      required this.tapped});

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

  void updateLeft() {
    widget.left();
  }

  void updateRight() {
    widget.right();
  }

  void updateTop() {
    widget.top();
  }

  void updateBottom() {
    widget.bottom();
  }

  @override
  void initState() {
    super.initState();
  }

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

            widget.tapped(true);

            if (details.delta.dx > 0.5) {
              updateRight();
            }

            if (details.delta.dx < -0.5) {
              updateLeft();
            }

            if (details.delta.dy > 0.5) {
              updateTop();
            }

            if (details.delta.dy < -0.5) {
              updateBottom();
            }
          } else {
            widget.tapped(false);
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
          glowColor: Colors.redAccent,
          duration: const Duration(milliseconds: 1000),
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
                color: Colors.red,
                borderRadius: const BorderRadius.all(Radius.circular(50))),
            child: Center(
              child: Container(
                height: 44,
                width: 44,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
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

import 'package:flutter/material.dart';

class PitchSide extends StatelessWidget {
  const PitchSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Positioned(
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
          )
        ],
      ),
    );
  }
}

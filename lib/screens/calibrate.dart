import 'package:flutter/material.dart';

class Calibrate extends StatelessWidget {
  const Calibrate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SafeArea(child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Text("Calibrate the pitch"), Text("Add the coordinates")],)
        )),
      ));
  }
}
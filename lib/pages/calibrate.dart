import 'package:flutter/material.dart';
import 'package:haptics_app/pages/pitch.dart';

class Calibrate extends StatelessWidget {
  const Calibrate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Calibrate Your Pitch",
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35),
                      ),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Add your pitch dimensions and the caribate all the coordinates",
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16,),textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Height',
                          border: InputBorder.none, // Remove the border here
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Color(0xFF0FE9D7),
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0x300FE9D7),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Width',
                          border: InputBorder.none, // Remove the border here
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Color(0xFF0FE9D7),
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0x300FE9D7),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: const Color(0xFF0FE9D7),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const PitchSide()),
  );
},
                      child: const Center(
                          child: Text(
                        'Calibrate',
                        style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                      ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

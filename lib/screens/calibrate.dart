import 'package:flutter/material.dart';

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
                const Text(
                  "Calibrate Your Pitch",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Add your pitch dimensions and the caribate all the coordinates",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                ),
                const SizedBox(
                  height: 30,
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
                          border: InputBorder.none, // Remove the border here
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Color(0xFF0FC2E9),
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0x280FC1E9),
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
                          hintText: 'Height',
                          border: InputBorder.none, // Remove the border here
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Color(0xFF0FC2E9),
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0x280FC1E9),
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
                              color: Color(0xFF0FC2E9),
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0x280FC1E9),
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
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: const Color(0xFF0FC2E9),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      onPressed: () {},
                      child: const Center(
                          child: Text(
                        'Caribrate',
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

import 'package:flutter/material.dart';

import 'package:adv_basics/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.indigo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const StartScreen(),
      ),
    )),
  );
}

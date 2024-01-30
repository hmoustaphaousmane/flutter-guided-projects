import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
            'Learn Flutter the fun way!',
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: () {},
            child: const Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}

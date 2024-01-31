import 'package:flutter/material.dart';

import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.indigo],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : activeScreen == 'results-screen'
                  ? const ResultsScreen()
                  : QuestionsScreen(onSelectAnswer: chooseAnswer),
        ),
      ),
    );
  }
}

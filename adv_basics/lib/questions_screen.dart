import 'package:flutter/material.dart';

import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    final currenQuestion = questions[0];

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currenQuestion.text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20.0),
          AnswerButton(
            answerText: currenQuestion.answers[0],
            onTap: () {},
          ),
          const SizedBox(height: 10.0),
          AnswerButton(
            answerText: currenQuestion.answers[1],
            onTap: () {},
          ),
          const SizedBox(height: 10.0),
          AnswerButton(
            answerText: currenQuestion.answers[2],
            onTap: () {},
          ),
          const SizedBox(height: 10.0),
          AnswerButton(
            answerText: currenQuestion.answers[3],
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

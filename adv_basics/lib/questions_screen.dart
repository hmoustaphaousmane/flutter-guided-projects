import 'package:flutter/material.dart';

import 'package:adv_basics/answer_button.dart';

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
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The question...',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20.0),
          AnswerButton(
            answerText: 'Anwer 1',
            onTap: () {},
          ),
          const SizedBox(height: 10.0),
          AnswerButton(
            answerText: 'Anwer 2',
            onTap: () {},
          ),
          const SizedBox(height: 10.0),
          AnswerButton(
            answerText: 'Anwer 3',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

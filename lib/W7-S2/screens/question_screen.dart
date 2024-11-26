import 'package:flutter/material.dart';
import 'package:flutter_class/W7-S2/model/quiz.dart';
import 'package:flutter_class/W7-S2/widgets/QuestionCard.dart';

class QuestionScreen extends StatelessWidget {
  final void Function(Question, String) onTap;
  final Question questions;

  const QuestionScreen({
    super.key,
    required this.onTap,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    questions.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (String choice in questions.possibleAnswers)
                        QuestionCard(
                          choice: choice,
                          onTap: (String choice) => onTap(questions, choice),
                        ),// this extract widget is in Widget
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

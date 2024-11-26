import 'package:flutter/material.dart';
import 'package:flutter_class/W7-S2/model/submission.dart';
class AnswerCard extends StatelessWidget {
  final String choice;          // The answer choice (A, B, C, D)
  final Answer answer;          // The answer object (contains correct choice info)
  final bool isCorrectAnswer;   // Whether this choice is the correct answer

  const AnswerCard({
    super.key,
    required this.choice,
    required this.answer,
    required this.isCorrectAnswer,
  });

  @override
  Widget build(BuildContext context) {
    Color answerColor = isCorrectAnswer ? Colors.green : Colors.red;

    return Row(
      children: [
        SizedBox(
          width: 24,
          child: isCorrectAnswer
              ? const Icon(Icons.check, color: Colors.white)
              : null,
        ),
        Expanded(
          child: Text(
            choice,
            style: TextStyle(
              color: answer.questionAnswer == choice ? answerColor : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

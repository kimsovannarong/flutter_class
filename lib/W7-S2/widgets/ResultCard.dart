import 'package:flutter/material.dart';
import 'package:flutter_class/W7-S2/model/submission.dart';
import 'package:flutter_class/W7-S2/widgets/AnswerCard.dart';
class ResultCard extends StatelessWidget {
  final Answer answer;
  final String questionIndex;

  const ResultCard({super.key, required this.answer, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    // Determine if the answer is correct (color will be green or red)
    Color displayColor = answer.isCorrect() ? Colors.green : Colors.red;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: displayColor, // Green for correct, Red for incorrect
              ),
              child: Center(
                child: Text(
                  questionIndex,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    answer.question.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Use the AnswerCard for each choice
                  Column(
                    children: [
                      for (String choice in answer.question.possibleAnswers)
                        AnswerCard(
                          choice: choice,
                          answer: answer,
                          isCorrectAnswer: answer.question.goodAnswer == choice,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

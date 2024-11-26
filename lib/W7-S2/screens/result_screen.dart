import 'package:flutter/material.dart';
import 'package:flutter_class/W7-S2/widgets/AnswerCard.dart';
import 'package:flutter_class/W7-S2/widgets/app_button.dart';
import '../model/quiz.dart';
import '../model/submission.dart';

class ResultScreen extends StatelessWidget {
  final void Function() onRestart;
  final Submission submission;
  final Quiz quiz;

  const ResultScreen({
    super.key,
    required this.onRestart,
    required this.submission,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    int correctAnswer = submission.getScore();
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "You answered $correctAnswer of ${submission.answers.length}!",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 400,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: submission.answers.length,
                          itemBuilder: (context, index) {
                            final answer = submission.answers[index];
                            return ResultCard(
                              answer: answer,
                              questionIndex: (index + 1).toString(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
               SizedBox(height: 20),
              AppButton("Restart Quiz", icon: Icons.arrow_forward, onTap: onRestart),
            ],
          ),
        ),
      ),
    );
  }
}

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

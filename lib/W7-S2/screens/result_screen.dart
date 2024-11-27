import 'package:flutter/material.dart';
import 'package:flutter_class/W7-S2/widgets/AnswerCard.dart';
import 'package:flutter_class/W7-S2/widgets/ResultCard.dart';
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
               SizedBox(height: 10),
              AppButton("Restart Quiz", icon: Icons.arrow_forward, onTap: onRestart),
            ],
          ),
        ),
      ),
    );
  }
}

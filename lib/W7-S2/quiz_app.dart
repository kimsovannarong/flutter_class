import 'package:flutter/material.dart';
import 'package:flutter_class/W7-S2/Quizstate.dart';
import 'package:flutter_class/W7-S2/model/quiz.dart';
import 'package:flutter_class/W7-S2/model/submission.dart';
import 'package:flutter_class/W7-S2/screens/question_screen.dart';
import 'package:flutter_class/W7-S2/screens/result_screen.dart';
import 'package:flutter_class/W7-S2/screens/welcome_screen.dart';



Color appColor = Colors.blue[500] as Color;

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Quizstate Screenstate = Quizstate.not_started;
  int currentQuestionIndex = 0;
  late Submission submission;

  @override
  void initState() {
    submission = Submission();
    super.initState();
  }

  void switchScreen(Quizstate newScreen) {
    setState(() {
      Screenstate = newScreen;
    });
  }

  void submitAnswer(Question question, String answer) {
    submission.addAnswer(question, answer);
    currentQuestionIndex++;
    if (currentQuestionIndex >= widget.quiz.questions.length) {
      switchScreen(Quizstate.finished);
      return;
    }
    setState(() {});
  }

  void restart() {
    currentQuestionIndex = 0;
    submission = Submission();
    switchScreen(Quizstate.not_started);
  }

  Widget getScreen() {
    switch (Screenstate) {
      case Quizstate.not_started:
        return WelcomeScreen(
          title: widget.quiz.title,
          onStart: () => switchScreen(Quizstate.started),
        );
      case Quizstate.started:
        return QuestionScreen(
          questions: widget.quiz.questions[currentQuestionIndex],
          onTap: submitAnswer,
        );
      case Quizstate.finished:
        return ResultScreen(
          onRestart: restart,
          submission: submission,
          quiz: widget.quiz,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;
    return MaterialApp(home: getScreen());
  }
}
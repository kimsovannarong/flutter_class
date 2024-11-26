import 'package:flutter/material.dart';
import 'quiz_app.dart';
import 'model/quiz.dart';

void main() {

  Question question1 =  Question(
      title: "Who is the best teacher?",
      possibleAnswers: ["ronan", "hongly", 'leangsiv'],
      goodAnswer: 'ronan');
  Question question2 =  Question(
      title: "What is your favorite activity in class?",
      possibleAnswers: ["self-learning", "sleeping", 'talking'],
      goodAnswer: 'sleeping');
  Question question3 =  Question(
      title: "What do you do in your free time?",
      possibleAnswers: ["studying", "biking", 'sleeping'],
      goodAnswer: 'sleeping');
  List<Question> myQuestions = [question1, question2,question3];
  Quiz quizApp = Quiz(title: "Crazy Quizzes", questions: myQuestions);

  runApp(QuizApp(quizApp));
}
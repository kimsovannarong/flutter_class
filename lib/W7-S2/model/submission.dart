import 'quiz.dart';
class Answer{
  final String questionAnswer;
  final Question question;
  Answer({required this.questionAnswer,required this.question});
  // function isCorrect
  bool isCorrect(){
    // if(questionAnswer==goodAnswer.goodAnswer){
    //   return true;
    // }else{
    //   return false;
    // }
    return questionAnswer==question.goodAnswer;
  }
}
class Submission {
  late List<Answer> answers=[];

  Submission();
  //function getScore
  int getScore() {
    int totalScore = 0;
    for (var answer in answers) {
      if (answer.isCorrect()) {
        totalScore++;
      }
    }
    return totalScore;
  }
  // function getAnswer
  Answer? getAnswerFor(Question question) {
    for (var answer in answers) {
      if (answer.question == question) {
        return answer;
      }
    }
    return null;
  }
  void addAnswer(Question question, String answer) {
    // check if question already have or not
    for (var i = 0; i < answers.length; i++) {
      if (answers[i].question == question) {
        // if the question exit then it will remove the previous
        answers.removeAt(i);
        break;
      }
    }
    // Add the new answer
    answers.add(Answer(questionAnswer: answer, question: question));
  }
  void removeAnswers() {
    answers.clear();
  }
}
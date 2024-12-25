import 'package:uuid/uuid.dart';

const uuid = Uuid();

class StudentScore{
  String name;
  double Score;
  StudentScore({required this.name,required this.Score});
}
class Course{
  String id;
  String courseName;
  List<StudentScore> studentScores;
  Course({required this.courseName,required this.studentScores}): id = uuid.v4();
}
import 'package:flutter/material.dart';
import 'package:flutter_class/Finalexam/models/course.dart';
import 'package:flutter_class/Finalexam/widgets/MyUtility.dart';
import 'package:flutter_class/Finalexam/widgets/course_view.dart';

import '../models/sampledata.dart';
class Coursesview extends StatefulWidget {
  const Coursesview({super.key});

  @override
  State<Coursesview> createState() => _CoursesviewState();
}

class _CoursesviewState extends State<Coursesview> {
  List<Course> courseItem=sampleData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Course view",style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child:  ListView.builder(
            itemCount: courseItem.length,
            itemBuilder: (context , index){
              final item=courseItem[index];
              final scoreCount=item.studentScores.length;
              return GestureDetector(
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context)=>Courseview()),
                  );
                  },
                  child: CoursesCard(courseName: item.courseName, scores: "${scoreCount} score", average: "average:")
              );
            }
        )
      ),
    );
  }
}
// GestureDetector(
// onTap:(){
// Navigator.push(
// context,
// MaterialPageRoute(builder:(context)=>Courseview()),
// );
// },
// child: CoursesCard(courseName: "HTML",scores: "3 scores",average: "Average: 76.7",)
// ),
// GestureDetector(
// onTap:(){
// Navigator.push(
// context,
// MaterialPageRoute(builder:(context)=>Courseview()),
// );
// },
// child: CoursesCard(courseName: "Java",scores: "no score",average: '',)
// ),
class CoursesCard extends StatelessWidget {
  final String courseName;
  final String scores;
  final String average;
  const CoursesCard({
    super.key,
    required this.courseName,
    required this.scores,
    required this.average,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:[boxShadow],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(courseName,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
          Text(scores,style: TextStyle(fontSize: 18),),
          Text(average,style: TextStyle(fontSize: 18),)
        ],
      ),
    );
  }
}

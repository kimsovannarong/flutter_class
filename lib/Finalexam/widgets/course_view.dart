import 'package:flutter/material.dart';
import 'package:flutter_class/Finalexam/models/course.dart';
import 'package:flutter_class/Finalexam/widgets/score_form.dart';

import '../models/sampledata.dart';
class Courseview extends StatefulWidget {
  const Courseview({super.key});

  @override
  State<Courseview> createState() => _CourseviewState();
}

class _CourseviewState extends State<Courseview> {
  List<Course> courseItem= sampleData;
  // Future<void> onAdd() async {
  //   // newitem will be gotten after the Navigaor pop(Groucery....)
  //   Course? newItem= await Navigator.of(context).push<Course>(
  //       MaterialPageRoute(builder:(context)=>ScoreFrom())
  //   );
  // StudentScore newstudentscore;
  // //function to get student score data
  // StudentScore getStudentscore(){
  //   for(int i=0;i<courseItem.length;i++){
  //     final newstudentscore=courseItem[i];
  //
  //   return newstudentscore;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("HTML",style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold
        ),),
        actions: [
          IconButton(
              onPressed:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>ScoreFrom()));
              },
              icon: Icon(Icons.add,color: Colors.white,)
          )
        ],
      ),
      body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context , index){
            return Container(
             child: ListTile(
               title: Text("hello"),
               trailing: Text("100"),
             ),
            );
          }
      ),
    );
  }
}

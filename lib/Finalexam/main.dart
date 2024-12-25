import 'package:flutter/material.dart';
import 'package:flutter_class/Finalexam/widgets/courses_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
 
      home: Coursesview(), // TODO To change
    );
  }
}

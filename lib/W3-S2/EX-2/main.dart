import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade300
      ),
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade600,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: Text("CADT STUDENTS",style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),),
        ),
      ),
    ),
  ));
}

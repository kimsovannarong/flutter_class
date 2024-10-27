import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      decoration: BoxDecoration(
        color: Colors.grey
      ),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(child: Text("OOP",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),)),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
            decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Center(child: Text("DART",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),)),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:[
                    Colors.blue.shade100,
                    Colors.blue.shade900
                  ]
                ),
                borderRadius: BorderRadius.circular(15)
            ),
            child: Center(child: Text("FLUTTER",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),)),
          ),
        ],
      ),
    ),
  ));
}

// Start from the exercice 3 code
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
          CustomCard(text: "OOP",color: Colors.blue.shade100,),
          CustomCard(text: "DART",color: Colors.blue.shade300,),
          CustomCard(text: "FLUTTER",gradientcolor: LinearGradient(colors: [
            Colors.blue.shade100,
            Colors.blue.shade900
          ]),),
        ],
      ),
    ),
  ));
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color color;
  final Gradient? gradientcolor;
  const CustomCard({
    super.key,
    required this.text,
    this.color=Colors.blue,
    this.gradientcolor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
      decoration: BoxDecoration(
          color: gradientcolor == null ? color : null, // Set color if gradient is null
          gradient: gradientcolor,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Center(child: Text(text,style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
      ),)),
    );
  }
}


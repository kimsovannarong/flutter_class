import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              color: Colors.grey
            ),
            child: Container(
                child: Column(
                  children: [
                    Customcadt(color_start: Colors.blue,color_end: Colors.red,text: "Hello Narong",),
                    Customcadt(color_start: Colors.blue,color_end: Colors.red,text: "Hello Narong",),
                    Customcadt(color_start: Colors.blue,color_end: Colors.red,text: "Hello Narong",),
                  ],
                ))),
      ),
    )
  );
}

class Customcadt extends StatelessWidget {
  final Color color_start;
  final Color color_end;
  final String text;
  const Customcadt({
    super.key,
    required this.color_start,
    required this.color_end,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.symmetric(horizontal: 0,vertical: 30),
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            color_start,
            color_end,
          ])
        ),
        child: Center(child: Text("Hello")
        )
    );
  }
}
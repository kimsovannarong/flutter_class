import 'package:flutter/material.dart';
// This Exercise haven't yet done because i have no more ideas to do !Sorry
void main() => runApp(MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.green,
    appBar: AppBar(
      backgroundColor: Colors.lightBlueAccent,
      title: const Text("Custom buttons"),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Scorecard(text: "My Score in Flutter", color: Colors.green),
              Scorecard(text: "My Score in Dart"),
              Scorecard(text: "My Score in React", color: Colors.green),
            ],
          ),
        ),
      ),
    ),
  ),
));

class Scorecard extends StatefulWidget {
  final String text;
  final Color? color;

  Scorecard({
    super.key,
    required this.text,
    this.color,
  });

  @override
  State<Scorecard> createState() => _ScorecardState();
}

class _ScorecardState extends State<Scorecard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            widget.text,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
              SizedBox(width: 20), // for horizontal space between these 2 icons
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            ],
          ),
          Container(
            height: 40,
            width: 500,
            decoration: BoxDecoration(
              color: widget.color,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}

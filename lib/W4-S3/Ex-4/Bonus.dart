import 'package:flutter/material.dart';

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
              Scorecard(text: "My Score in Flutter"),
              Scorecard(text: "My Score in Dart"),
              Scorecard(text: "My Score in React"),
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
  int score = 0;
  int maxScore = 5; // the maximum score
  void Increase(){
    setState(() {
      if(score<maxScore){
        score++;
      }
    });
  }
  void Decrease(){
    setState(() {
      if(score>0){
        score--;
      }
    });
  }
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
              IconButton(
                onPressed: Decrease,//function decrease score
                icon: Icon(Icons.remove),
              ),
              SizedBox(width: 20), // for horizontal space between these 2 icons
              IconButton(
                onPressed:Increase,//function increase the scoe
                icon: Icon(Icons.add),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                height: 40,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                height: 40,
                width: 500 * (score / maxScore),
                decoration: BoxDecoration(
                  color: widget.color != null ? widget.color : Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

//Q1 - In what scenarios might one approach be more advantageous than another?
//Ans:

List<String> colors = ["red", "blue", "green"];
List<Widget> getColors() {
  return colors.map((item) => Text('Colors: $item')).toList();
}
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Color(0xffffcccc),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children:  [
            Label("Method 1: Loop in Array", bold: true),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Start"),
                for (var i = 0; i < colors.length; i++) Text('Color : ${colors[i]}'),
                Text("End"),
              ],
            ),
            Label("Method 2: Map", bold: true),
            Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Start"),
                ...colors.map((item) => Text("Colors:  $item")).toList(),
                Text("End"),
              ],
            ),
            Label("Method 23: Dedicated Function", bold: true),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Start"),
                ...getColors(),
                Text("End")
              ],
            )
        ],
        ),
      ),
    ),
  ));
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}

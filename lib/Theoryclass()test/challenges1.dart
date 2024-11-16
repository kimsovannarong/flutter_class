import 'package:flutter/material.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Switchnum(),
      )
    ),
  );
}
class Switchnum extends StatefulWidget {
  const Switchnum({super.key});

  @override
  State<Switchnum> createState() => _SwitchnumState();
}

class _SwitchnumState extends State<Switchnum> {
  List<int> number=[1,2,3,4,5];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Gooooooo"),
          ... number.map((item) => Text(item.toString())).toList(),
        ],
      ),
    );
  }
}

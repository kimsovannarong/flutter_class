import 'package:flutter/material.dart';
class QuestionCard extends StatelessWidget {
  final String choice;
  final Function onTap;

  const QuestionCard({
    Key? key,
    required this.choice,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        onPressed: () => onTap(choice),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        child: Text(
          choice,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

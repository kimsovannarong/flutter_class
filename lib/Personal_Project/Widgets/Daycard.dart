import 'package:flutter/material.dart';
class DayCard extends StatelessWidget {
  final String day;
  final String date;
  final Function onTap;

  const DayCard({Key? key, required this.day, required this.date, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5, spreadRadius: 1),
          ],
        ),
        child: Column(
          children: [
            Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(date),
          ],
        ),
      ),
    );
  }
}
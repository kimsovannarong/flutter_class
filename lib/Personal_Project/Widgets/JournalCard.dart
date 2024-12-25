import 'package:flutter/material.dart';
import 'package:flutter_class/Personal_Project/Utility/colors.dart';

class JournalCard extends StatelessWidget {
  final String date;
  final String quote;
  final Function onEdit;
  final Function onDelete;

  const JournalCard({
    Key? key,
    required this.date,
    required this.quote,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 90,
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '"${quote}"',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
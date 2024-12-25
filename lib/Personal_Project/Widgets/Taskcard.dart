import 'package:flutter/material.dart';
import 'package:flutter_class/Personal_Project/Model/Enums.dart';
import 'package:flutter_class/Personal_Project/Utility/Boxshadow.dart';
class TaskCard extends StatefulWidget {
  final String taskTitle;
  final TaskIcon taskIcon;

  const TaskCard({super.key, required this.taskTitle, required this.taskIcon});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        boxShadow:  [myboxShadow],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(widget.taskIcon.icon, size: 40, color: widget.taskIcon.color), // Use icon and color
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              widget.taskTitle,
              style: TextStyle(
                decoration: isClicked ? TextDecoration.lineThrough : TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isClicked = !isClicked;
              });
            },
            icon: Icon(
              isClicked ? Icons.check_box : Icons.check_box_outline_blank,
              size: 30,
              color: isClicked ? Colors.blue : Colors.black26,
            ),
          ),
        ],
      ),
    );
  }
}

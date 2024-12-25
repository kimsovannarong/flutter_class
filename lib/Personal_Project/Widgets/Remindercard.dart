import 'package:flutter/material.dart';
import 'package:flutter_class/Personal_Project/Model/Enums.dart';
import 'package:flutter_class/Personal_Project/Utility/Boxshadow.dart';

class ReminderCard extends StatelessWidget {
  const ReminderCard({super.key,required this.reminderIcon,required this.number,required this.reminderStatus});
  final IconData reminderIcon;
  final String number;
  final ReminderStatus reminderStatus;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 175,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow:  [myboxShadow],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(reminderIcon,size: 30,color: Colors.blueAccent,),
                Text(number,style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),)
              ],
            ),
            Text(reminderStatus.name,style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),)
          ],
        ),
      ),
    );
  }
}

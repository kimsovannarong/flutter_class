
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_class/W8-S1/models/expense.dart';
class Expense_Item extends StatefulWidget {
  final String title;
  final double price;
  final DateTime date;
  final Category category;
  Expense_Item({
    super.key,
    required this.title,
    required this.price,
    required this.date,
    required this.category
  });

  @override
  State<Expense_Item> createState() => _Expense_ItemState();
}

class _Expense_ItemState extends State<Expense_Item> {
  // to get icon based on categroires
  IconData getIconForCategory( Category category) {
    switch (category) {
      case Category.food:
        return Icons.fastfood_sharp;
      case Category.travel:
        return Icons.card_travel;
      case Category.leisure:
        return Icons.headset;
      case Category.work:
        return Icons.work;
    }
  }
  @override
  Widget build(BuildContext context) {
    final date =  DateFormat.yMd().format(widget.date);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "\$${widget.price}",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Icon(getIconForCategory(widget.category),color: Colors.black,),
                SizedBox(width: 5),
                Text(
                  date,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

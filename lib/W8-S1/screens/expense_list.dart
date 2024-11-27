import 'package:flutter/material.dart';
import 'package:flutter_class/W8-S1/models/expense.dart';
import 'package:flutter_class/W8-S1/screens/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  // @override
  // Widget build(BuildContext context) {
  //   return ListView(
  //     children: [
  //       ...expenses.map( (e) => Text(e.title),)
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Expense_Item(
            title:expenses[index].title,
            price:expenses[index].amount,
            date:expenses[index].date,
            category:expenses[index].category),
        // itemBuilder: (context, index) => Text(index.toString() + " - " + expenses[index].title),
      ),
    );
  }
}

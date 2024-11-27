import 'package:flutter/material.dart';
import 'package:flutter_class/W8-S1/models/expense.dart';
import 'package:flutter_class/W8-S1/screens/expense_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Hotpot',
      amount: 5,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Tour',
      amount: 1000,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 15),
        child: ExpensesList(expenses: _registeredExpenses),
      ),
    );
  }
}

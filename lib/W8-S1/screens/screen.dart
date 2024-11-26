import 'package:flutter/material.dart';
import 'package:flutter_class/W8-S1/models/expense.dart';

class Expenses extends StatefulWidget {
  late List<Expense> registered_expenses;

  Expenses({super.key,});
  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Narong is the best in jay luy"),
        actions: [
          TextButton(
              onPressed: (){},
              child: Icon(Icons.add,color: Colors.black,size: 30,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Espense_list(),
      ),
    );
  }
}
class Espense_list extends StatefulWidget {
  const Espense_list({super.key});

  @override
  State<Espense_list> createState() => _Espense_listState();
}

class _Espense_listState extends State<Espense_list> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Expense_Item(),
          Expense_Item(),
        ],
      ),
    );
  }
}
class Expense_Item extends StatefulWidget {
  const Expense_Item({super.key});

  @override
  State<Expense_Item> createState() => _Expense_ItemState();
}

class _Expense_ItemState extends State<Expense_Item> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Title"),
                SizedBox(
                  height: 10,
                ),
                Text("Price")
              ],
            ),
            Row(
              children: [
                Icon(Icons.date_range_rounded),
                Text("11/11/2024")
              ],
            )
          ],
        ),
      ),
    );
  }
}

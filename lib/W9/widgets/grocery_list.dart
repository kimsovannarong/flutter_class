import 'package:flutter/material.dart';
import 'package:flutter_class/W9/widgets/new_item.dart';
import '../data/dummy_items.dart';
import '../models/grocery_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void onAddPressed() {
    // showModalBottomSheet(
    //   context: context,
    //   isScrollControlled: true,
    //   // builder: (ctx) => NewItem(),
    //   Navigator.push(context, route)
    // );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  NewItem()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: dummyGroceryItems.length,
        itemBuilder: (ctx, index) => GroceryTile(dummyGroceryItems[index]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: onAddPressed,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile(this.groceryItem, {super.key});

  final GroceryItem groceryItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(groceryItem.name),
      leading: Container(
        width: 24,
        height: 24,
        color: groceryItem.category.color,
      ),
      trailing: Text(
        groceryItem.quantity.toString(),
      ),
    );
  }
}
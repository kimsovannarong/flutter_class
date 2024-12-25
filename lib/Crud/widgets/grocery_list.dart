import 'package:flutter/material.dart';
import 'package:flutter_class/Crud/widgets/new_item.dart';
import '../data/dummy_items.dart';
import '../models/grocery_item.dart';
import '../models/mode.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> groceries = dummyGroceryItems;

  Future<void> _addNewGrocery() async {
    final newGrocery = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NewItem(mode: Mode.creating),
      ),
    );

    if (newGrocery is GroceryItem) {
      setState(() {
        groceries.add(newGrocery);
      });
    }
  }

  Future<void> _editGrocery(GroceryItem item) async {
    final updatedGrocery = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewItem(mode: Mode.editing, item: item),
      ),
    );

    if (updatedGrocery is GroceryItem) {
      setState(() {
        final index = groceries.indexOf(item);
        if (index >= 0) {
          groceries[index] = updatedGrocery; 
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (groceries.isNotEmpty) {
      content = ListView.builder(
        itemCount: groceries.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () => _editGrocery(groceries[index]), 
            child: GroceryTile(groceries[index]),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addNewGrocery,
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
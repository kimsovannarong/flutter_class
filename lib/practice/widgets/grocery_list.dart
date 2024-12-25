import 'package:flutter/material.dart';
import 'package:flutter_class/practice/models/grocery_item.dart';
import '../data/dummy_items.dart';
import 'new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> groceryItems=dummyGroceryItems;
  // use async and await because only after we crate new and it will pop up from form data will be sent here
  Future<void> onAdd() async {
    // newitem will be gotten after the Navigaor pop(Groucery....)
    GroceryItem? newItem= await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder:(context)=>NewItem())
    );
  // don't forget setState
    if(newItem!=null){
      setState(() {
        groceryItems.add(newItem);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));
    if (dummyGroceryItems.isNotEmpty) {
      content=ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (context , index){
          final item =groceryItems[index];
            return Grocerytile(item: item);
          }
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed:onAdd,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

class Grocerytile extends StatelessWidget {
  const Grocerytile({
    super.key,
    required this.item,
  });

  final GroceryItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 15,
        height: 15,
        color: item.category.color,
      ),
      title: Text(item.name),
      trailing: Text(item.quantity.toString()),
    );
  }
}


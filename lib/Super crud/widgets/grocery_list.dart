import 'package:flutter/material.dart';
import '../models/grocery_item.dart';
import 'new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  bool _iselectionMode = false;

  void _addItem() async {
    GroceryItem? newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const EditItem(mode: EditionMode.creating),
      ),
    );

    if (newItem != null) {
      setState(() {
        _groceryItems.add(newItem);
      });
    }
  }

  void _editItem(GroceryItem item) async {
    GroceryItem? editedItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => EditItem(
          mode: EditionMode.editing,
          editedItem: item,
        ),
      ),
    );

    if (editedItem != null) {
      int index = _groceryItems.indexOf(item);
      setState(() {
        _groceryItems[index] = editedItem;
      });
    }
  }

  void _switchOnSelectionMode(GroceryItem item) {
    setState(() {
      item.isSelected = true;
      _iselectionMode = true;
    });
  }

  void _switchOffCreationnMode() {
    setState(() {
      _iselectionMode = false;
    });
  }

  void _removeItem(GroceryItem item) async {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  void _removeSelection() {
    setState(() {
      _groceryItems = _groceryItems
          .where(
            (element) => !element.isSelected,
          )
          .toList();
      _iselectionMode = false;
    });
  }

  void _updateSelection(GroceryItem item, bool newSelection) {
    setState(() {
      item.isSelected = newSelection;
    });
  }

  int get selectedItems =>
      _groceryItems.where((element) => element.isSelected).length;


void _onReorder(int oldIndex, int newIndex) {

   setState(() {
      // Adjust newIndex for insertion
      if (newIndex > oldIndex) newIndex -= 1;

      // Update the list order
      final item = _groceryItems.removeAt(oldIndex);
      _groceryItems.insert(newIndex, item);
    });
}
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (_groceryItems.isNotEmpty) {
      content = ReorderableListView(
        onReorder: _onReorder,
        children: _groceryItems.map( (item) => ListTile(
          key: ValueKey(item),
          onLongPress: () => _switchOnSelectionMode(item),
          onTap: () => _editItem(item),
          title: Text(item.name),
          leading: _iselectionMode
              ? Checkbox(
                  value: item.isSelected,
                  onChanged: (value) =>
                      _updateSelection(item, value!))
              : Container(
                  width: 24,
                  height: 24,
                  color: item.category.color,
                ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text( item.quantity.toString(),  ),
          ),
        )).toList(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: _iselectionMode
            ? IconButton(
                onPressed: _switchOffCreationnMode,
                icon: const Icon(Icons.arrow_back),
              )
            : null,
        title: _iselectionMode
            ? Text('$selectedItems selected Item(s)')
            : const Text('Your Groceries'),
        actions: _iselectionMode
            ? [
                IconButton(
                  onPressed: _removeSelection,
                  icon: const Icon(Icons.delete),
                )
              ]
            : [
                IconButton(
                  onPressed: _addItem,
                  icon: const Icon(Icons.add),
                ),
              ],
      ),
      body: content,
    );
  }
}

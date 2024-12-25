import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart'; 
import '../models/grocery_category.dart';
import '../models/grocery_item.dart';
import '../models/mode.dart';

class NewItem extends StatefulWidget {
  final Mode mode;
  final GroceryItem? item;

  const NewItem({
    required this.mode,
    this.item,
    super.key,
  });

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  String? _itemName;
  String? _itemQuantity;
  GroceryCategory? _selectedCategory;

  final _formKey = GlobalKey<FormState>();

  // add
  void _onAddItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newItem = GroceryItem(
        id: widget.mode == Mode.editing ? widget.item!.id : const Uuid().v4(), 
        name: _itemName!,
        quantity: int.parse(_itemQuantity!),
        category: _selectedCategory!,
      );

      Navigator.pop(context, newItem); //
    }
  }
  // reset

  void _onReset() {
    _formKey.currentState!.reset();
    setState(() {
      _itemName = null;
      _itemQuantity = '1';
      _selectedCategory = null;
    });
  }

  String? validateTitle(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= 1 ||
        value.trim().length > 50) {
      return 'Must be between 1 and 50 characters.';
    }
    return null;
  }

  String? _quantityValidator(String? value) {
    if (value == null || 
     value.isEmpty || 
     int.tryParse(value) == null 
     || int.parse(value) <= 0) {
      return 'Must be a valid and positive number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mode == Mode.editing ? 'Edit Item' : 'Add a New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: validateTitle,
                onSaved: (value) {
                  _itemName = value;
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: _quantityValidator,
                      decoration: const InputDecoration(
                        labelText: 'Quantity',
                      ),
                      initialValue: _itemQuantity ?? '1',
                      onSaved: (value) {
                        _itemQuantity = value;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      value: _selectedCategory,
                      items: [
                        for (final category in GroceryCategory.values)
                          DropdownMenuItem<GroceryCategory>(
                            value: category,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.label),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Category',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _onReset, 
                    child: const Text('Reset'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _onAddItem,
                    child: Text(widget.mode == Mode.editing ? 'Save Changes' : 'Add Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/grocery_category.dart';
import '../models/grocery_item.dart';

enum EditionMode { editing, creating }

class EditItem extends StatefulWidget {
  const EditItem({super.key, required this.mode, this.editedItem});

  final EditionMode mode;
  final GroceryItem? editedItem; // Only in edition mode

  @override
  State<EditItem> createState() {
    return _EditItemState();
  }
}

class _EditItemState extends State<EditItem> {
  final _formKey = GlobalKey<FormState>();
  Uuid uuid = const Uuid();

  late GroceryCategory _enteredCategory;
  late String _enteredName;
  late int _enteredQuantity;

  @override
  void initState() {
    super.initState();

    if (editingMode) {
      _enteredCategory = widget.editedItem!.category;
      _enteredName = widget.editedItem!.name;
      _enteredQuantity = widget.editedItem!.quantity;
    } else {
      _enteredCategory = GroceryCategory.fruit;
      _enteredName = '';
      _enteredQuantity = 1;
    }
  }

  void _saveItem() {
    bool isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();
      String id = editingMode ? widget.editedItem!.id : uuid.v4();
      Navigator.of(context).pop(
        GroceryItem(
          id: id,
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _enteredCategory,
        ),
      );
    }
  }

  bool get editingMode => widget.mode == EditionMode.editing;
  bool get creatingMode => widget.mode == EditionMode.creating;

  String get buttonLabel => creatingMode ? "Add" : "Edit";
  String get headerLabel => creatingMode ? "Add a new item" : "Edit item";

  void _resetForm() {
    _formKey.currentState!.reset();
  }

  String? validateTitle(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length > 50) {
      return 'Must be between 1 and 50 characters.';
    }
    return null;
  }

  String? validateAmount(String? value) {
    if (value == null ||
        value.isEmpty ||
        int.tryParse(value) == null ||
        int.tryParse(value)! <= 0) {
      return 'Must be a valid, positive number.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(headerLabel),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _enteredName,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: validateTitle,
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: _enteredQuantity.toString(),
                      validator: validateAmount,
                      onSaved: (value) {
                        _enteredQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      value: _enteredCategory,
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
                        _enteredCategory = value!;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _resetForm,
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: Text(buttonLabel),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

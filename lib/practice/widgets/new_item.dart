import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/grocery_category.dart';
import '../models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey=GlobalKey<FormState>();
  Uuid uuid=Uuid();
  String _enteredName='';
  int _enteredAmount= 1;
  GroceryCategory _enteredCategory = GroceryCategory.fruit; // Set a default value
  // function to add

  // function to validate
  String? validateTitle(String? value){
    if(value == null || value.trim().length >50 ||value.isEmpty){
      return "Title must be between 1 or 50";
    }
    return null;
  }
  // function to validate quantity
  String? validateAmount(String? value){
    final amount=double.tryParse(value??'');
    if(amount==null || amount <0){
      return "amount shall be valid and positve";
    }
    return null;
  }
  // function save
  @override
  Widget build(BuildContext context) {
    void onSave(){
      bool isValid=_formKey.currentState!.validate();
      if(isValid){
        _formKey.currentState!.save();
        print(_enteredName);
        print(_enteredAmount);
        print(_enteredCategory.label);
        String id=uuid.v4();
        Navigator.of(context).pop(
          GroceryItem(
              id: id,
              name: _enteredName,
              quantity: _enteredAmount,
              category: _enteredCategory
          )
        );
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
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
                validator: validateTitle,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                onSaved: (value){
                  _enteredName=value!;
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: validateAmount,
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: _enteredAmount.toString(),
                      onSaved: (value){
                        _enteredAmount=int.parse(value!);
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
                        _enteredCategory=value!;
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
                    onPressed: () => {},
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: onSave,
                    child: const Text('Add Item'),
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

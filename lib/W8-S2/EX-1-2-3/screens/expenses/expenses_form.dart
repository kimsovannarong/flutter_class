import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  Category dropdownValue = Category.food;
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }
  void onCancel() {
    
    // Close modal
    Navigator.pop(context);
  }

  void onAdd() {
    // 1- Get the values from inputs
    String title = _titleController.text;
    double? amount= double.parse(_valueController.text);

    // 2- Create the expense
    Expense expense = Expense(
        title: title,
        amount: amount!,
        date: selectedDate!,     //
        category: dropdownValue); //  Done

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
    // alert dialog
    if (title.isEmpty) {
      _showAlert('Invalid input', 'The title cannot be empty.');
      return;
    }
    if(amount==null){
      _showAlert('Invalid input', 'The amount shall be a positive number');
      return;
    }
  }
  // display dialog
  void _showAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _valueController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    selectedDate == null
                        ? "Not selected"
                        : "${selectedDate!.toLocal()}".split(" ")[0],
                  ),
                  IconButton(
                      onPressed:_selectDate,
                      icon: Icon(Icons.calendar_month))
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DropdownButton<Category>(
                value: dropdownValue,
                onChanged: (Category? selectedValue) {
                  if (selectedValue != null) {
                    setState(() {
                      dropdownValue = selectedValue;
                    });
                  }
                },
                items: Category.values.map((Category category) {
                  return DropdownMenuItem<Category>(
                    value: category, // Set the value property
                    child: Text(
                      category.name.toUpperCase(), // Display enum name
                    ),
                  );
                }).toList(),
              ),
              Spacer(),// for horizental space
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: onAdd,
                  child: const Text('Save Expense')),
            ],
          )
        ],
      ),
    );
  }
}

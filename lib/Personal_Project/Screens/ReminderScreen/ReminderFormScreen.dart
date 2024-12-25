import 'package:flutter/material.dart';
import 'package:flutter_class/Personal_Project/Model/Enums.dart';
import 'package:flutter_class/Personal_Project/Model/class.dart';
import 'package:flutter_class/Personal_Project/Utility/colors.dart';

enum ReminderFormAction { create, edit }

class ReminderFormScreen extends StatefulWidget {
  final Function(Reminder) onAddReminder;
  final Reminder? initialReminder;
  final ReminderFormAction action;

  const ReminderFormScreen({
    super.key,
    required this.onAddReminder,
    this.initialReminder,
    required this.action,
  });

  @override
  State<ReminderFormScreen> createState() => _ReminderFormScreenState();
}

class _ReminderFormScreenState extends State<ReminderFormScreen> {
  final TextEditingController eventTitle = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    if (widget.action == ReminderFormAction.edit && widget.initialReminder != null) {
      eventTitle.text = widget.initialReminder!.eventTitle;
      selectedDate = widget.initialReminder!.selectedDate;
      selectedTime = widget.initialReminder!.selectedTime;
    }
  }
  // select date
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  // select time
  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }
  // creating function
  void _submit() {
    if (eventTitle.text.isNotEmpty && selectedDate != null && selectedTime != null) {
      final newReminder = Reminder(
        eventTitle: eventTitle.text,
        selectedDate: selectedDate!,
        selectedTime: selectedTime!,
        status: ReminderStatus.All,
      );
      widget.onAddReminder(newReminder);
      Navigator.pop(context);
    } else {
      // Handle validation error, show a message if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      onPressed: _submit,
                      child: Text(
                        widget.action == ReminderFormAction.create ? "Create" : "Save Edit",// change label based on form action
                        style: const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add reminder",
                      style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: eventTitle,
                      maxLength: 25,
                      decoration: InputDecoration(
                        labelText: 'Event Title',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text("Select Date", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 18)),
                    Row(
                      children: [
                        IconButton(
                          onPressed: _selectDate,
                          icon: Icon(Icons.calendar_today, size: 30, color: Darkyellow),
                        ),
                        Text(selectedDate == null ? "Not selected" : "${selectedDate!.toLocal()}".split(" ")[0]),
                      ],
                    ),
                    Text("Select Time", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 18)),
                    Row(
                      children: [
                        IconButton(
                          onPressed: _selectTime,
                          icon: Icon(Icons.access_time, size: 30, color: Darkyellow),
                        ),
                        Text(selectedTime == null ? "Not selected" : selectedTime!.format(context)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
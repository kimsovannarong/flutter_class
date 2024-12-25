import 'package:flutter/material.dart';
import 'package:flutter_class/Personal_Project/Model/Enums.dart';
import 'package:flutter_class/Personal_Project/Model/class.dart';
import 'package:flutter_class/Personal_Project/Screens/JournalScreen/IconMoodselection.dart';
import 'package:flutter_class/Personal_Project/Utility/colors.dart';
import 'package:uuid/uuid.dart';

enum JournalFormAction { edit, create }

class JournalFormScreen extends StatefulWidget {
  final Journal? initialJournal; // Receive the initial journal for editing
  final Function(Journal) onAddJournal; // Callback for adding journal
  final JournalFormAction action;

  const JournalFormScreen({
    super.key,
    this.initialJournal,
    required this.onAddJournal,
    required this.action,
  });

  @override
  State<JournalFormScreen> createState() => _JournalFormScreenState();
}

class _JournalFormScreenState extends State<JournalFormScreen> {
  Mood selectedMoodIcon = Mood.happy;
  DateTime? selectedDate;
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quoteController = TextEditingController(); // Controller for the quote

  @override
  void initState() {
    super.initState();
    if (widget.initialJournal != null) {
      selectedDate = widget.initialJournal!.date;
      descriptionController.text = widget.initialJournal!.description;
      quoteController.text = widget.initialJournal!.quote; // Pre-fill quote
      selectedMoodIcon = widget.initialJournal!.mood;
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (context, picker) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.deepPurple,
            colorScheme: ColorScheme.light(primary: Colors.deepPurple),
            dialogBackgroundColor: Colors.white,
          ),
          child: picker!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    descriptionController.dispose();
    quoteController.dispose();
    super.dispose();
  }

  void _createOrUpdateJournalEntry() {
    if (selectedDate != null && descriptionController.text.isNotEmpty) {
      final journal = Journal(
        date: selectedDate!,
        description: descriptionController.text,
        quote: quoteController.text,
        mood: selectedMoodIcon,
      );
      widget.onAddJournal(journal); // Pass journal back
      Navigator.pop(context); // Close the modal
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a date and enter a description')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
              // Top bar
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
                      onPressed: _createOrUpdateJournalEntry,
                      child: Text(
                        widget.action == JournalFormAction.create ? "Create" : "Save Edit",
                        style: const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "What was your day?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  final result = await showModalBottomSheet<Mood>(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) {
                      return FractionallySizedBox(
                        heightFactor: 0.73,
                        child: const IconMoodSelectionScreen(),
                      );
                    },
                  );
                  if (result != null) {
                    setState(() {
                      selectedMoodIcon = result; // Update selected icon
                    });
                  }
                },
                child: Icon(
                  selectedMoodIcon.icon,
                  color: selectedMoodIcon.color,
                  size: 80,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Select Date",
                    style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _selectDate,
                        icon: Icon(Icons.calendar_month, size: 30, color: Darkyellow),
                      ),
                      Text(
                        selectedDate == null
                            ? "Not selected"
                            : "${selectedDate!.toLocal()}".split(" ")[0],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Add Quote",
                    style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: quoteController,
                    maxLength: 120,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: 'Your inspirational quote',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Add Description",
                    style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: descriptionController,
                    maxLength: 120,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: 'Your description of the day',
                    ),
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
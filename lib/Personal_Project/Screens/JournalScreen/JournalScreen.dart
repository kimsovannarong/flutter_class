import 'package:flutter/material.dart';
import 'package:flutter_class/Personal_Project/Utility/colors.dart';
import 'package:intl/intl.dart';
import 'package:flutter_class/Personal_Project/Model/Enums.dart';
import 'package:flutter_class/Personal_Project/Model/class.dart';
import 'package:flutter_class/Personal_Project/Screens/JournalScreen/JournalFormScreen.dart';
import 'package:flutter_class/Personal_Project/Widgets/JournalCard.dart';
import 'package:slideable/Slideable.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  List<Journal> dailyJournals = [
    Journal(
        date: DateTime.parse("2024-12-09"),
        description: "I’m happy to embrace the little moments today. I woke up feeling refreshed, ready to tackle the day ahead. The sun is shining, and I’ve decided to take a long walk in the park. I’m excited to connect with nature, breathe in the fresh air, and enjoy the vibrant colors of the season. Later, I plan to meet up with friends for coffee, sharing laughter and stories that brighten our spirits. Overall, I feel grateful for the simple joys and the warmth of connection that make today truly special.",
        mood: Mood.happy,
        quote: "Try today proud later"
    ),
    Journal(
        date: DateTime.parse("2024-12-10"),
        description: 'I’m feeling a strong sense of motivation today, eager to learn something new and be productive. The energy around me is inspiring, and I’m ready to dive into new projects and challenges. Whether it’s picking up a new skill or tackling tasks on my to-do list, I’m excited about the possibilities that lie ahead. This drive to grow and accomplish feels invigorating, and I can’t wait to see what I can achieve.',
        mood: Mood.excited,
        quote: "Keep pushing"
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Sort journals by date on
    dailyJournals.sort((a, b) => b.date.compareTo(a.date)); // Sort descending
  }
  // creating journal function
  void _addJournal() {
    showModalBottomSheet<Journal>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.73,
          child: JournalFormScreen(
            onAddJournal: (journal) {
              setState(() {
                dailyJournals.add(journal);
                dailyJournals.sort((a, b) => b.date.compareTo(a.date)); // Sort after adding
              });
            },
            action: JournalFormAction.create,
          ),
        );
      },
    );
  }
  // editing journal function
  void _editJournal(Journal journal) {
    showModalBottomSheet<Journal>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.73,
          child: JournalFormScreen(
            initialJournal: journal,
            onAddJournal: (updatedJournal) {
              setState(() {
                int index = dailyJournals.indexOf(journal);
                dailyJournals[index] = updatedJournal;
                dailyJournals.sort((a, b) => b.date.compareTo(a.date)); // Sort after editing
              });
            },
            action: JournalFormAction.edit,
          ),
        );
      },
    );
  }
  // removing journal function
  void _removeJournal(int index) {
    final removedJournal = dailyJournals[index]; // Store the removed journal
    setState(() {
      dailyJournals.removeAt(index);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Journal deleted.'),
          action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                dailyJournals.insert(index, removedJournal); // Add it back at the same index
              });
            },
          ),
          duration: Duration(seconds: 5),
        ),
      );
    });
  }
  // dsiplaying journal detail
  void _showJournalDetails(Journal journal) {
    final formattedDate = DateFormat('dd MMM yyyy').format(journal.date);
    // dialog for detail journal !
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star,color: Darkyellow,size: 30,),
                    Text("My daily jounal",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: blue)),
                    Icon(Icons.star,color: Darkyellow,size: 30,)
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: double.maxFinite,
                  height: 8,
                  color: blue,
                ),
                Center(child: Icon(journal.mood.icon, size: 80, color: journal.mood.color)),
                SizedBox(width: 15),
                Text(
                  formattedDate,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  journal.description,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  '"${journal.quote}"',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addJournal,
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView.builder(
          itemCount: dailyJournals.length,
          itemBuilder: (context, index) {
            final journal = dailyJournals[index];
            final formattedDate = DateFormat('dd MMM yyyy').format(journal.date);
            return GestureDetector(
              onTap: () => _showJournalDetails(journal),
              child: Slideable(
                items: <ActionItems>[
                  ActionItems(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                      size: 40,
                    ),
                    onPress: () => _editJournal(journal),
                    backgroudColor: Colors.transparent,
                  ),
                  ActionItems(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 40,
                    ),
                    onPress: () => _removeJournal(index),
                    backgroudColor: Colors.transparent,
                  ),
                ],
                child: JournalCard(
                  date: formattedDate,
                  quote: journal.quote,
                  onEdit: () => _editJournal(journal),
                  onDelete: () => _removeJournal(index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
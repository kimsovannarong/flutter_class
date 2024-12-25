import 'package:flutter/material.dart';
import 'package:flutter_class/Personal_Project/Screens/JournalScreen/JournalScreen.dart';
import 'package:flutter_class/Personal_Project/Screens/ProfileScreen/profileScreen.dart';
import 'package:flutter_class/Personal_Project/Screens/ReminderScreen/ReminderScreen.dart';
import 'package:flutter_class/Personal_Project/Screens/RoutineScreen/RoutineScreen.dart';
import 'package:flutter_class/Personal_Project/Utility/colors.dart';
import 'package:flutter_class/Personal_Project/Widgets/BottomnavBar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainScreen> {
  int _currentIndex = 0; // the current index of screen
  final List<Widget> screens = [];
  final List<String> appBars = [
    "",  // empty string app bar for routine screen
    "Reminder",
    "Journal",
    "Profile"
  ];
  // displaying the comment dialog
  void FeedbackForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Feedback",style: TextStyle(fontWeight: FontWeight.bold),),
          content: SizedBox(
            height: 100,
            child: Column(
              children: [
                SizedBox(height: 10),
                TextField(
                  maxLength: 50,
                  decoration: InputDecoration(
                    hintText: "Enter your feedback here",
                    label: Text("Your feedback"),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Handle the feedback submission logic here
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: lightblue, // Set the background color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Optional padding
              ),
              child: Text("Send feedback"),
            ),
          ],
        );
      },
    );
  }
  @override
  void initState() {
    super.initState();
    screens.addAll([
      RoutineScreen(),
      ReminderScreen(),
      JournalScreen(),
      ProfileScreen(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex != 0  // Check if it's not the RoutineScreen
          ? AppBar(
        title: Text(
          appBars[_currentIndex],
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: _currentIndex == 3  // if current Index =3 => profile screen then it has 2 ICon buttons
            ? [
          IconButton(
            icon: const Icon(
              Icons.comment,
              color: Colors.black,
              size: 25,
            ),
            onPressed: (){
              FeedbackForm(context);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {},
          ),
        ]
            : [],
      )
          : null,  // Don't show AppBar for RoutineScreen
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_class/Personal_Project/Model/Enums.dart';
import 'package:flutter_class/Personal_Project/Model/class.dart';
import 'package:flutter_class/Personal_Project/Screens/RoutineScreen/IconSelectionScreen.dart';

enum RoutineFormAction { create, edit }

class RoutineFormScreen extends StatefulWidget {
  final Function(Routine) onAddRoutine;
  final Routine? initialRoutine;
  final RoutineFormAction action;

  RoutineFormScreen({
    required this.onAddRoutine,
    this.initialRoutine,
    required this.action,
  });

  @override
  State<RoutineFormScreen> createState() => _RoutineFormScreenState();
}

class _RoutineFormScreenState extends State<RoutineFormScreen> {
  TaskIcon selectedIcon = TaskIcon.reading; // Default selected icon
  final TextEditingController taskController = TextEditingController();
  int charCount = 0;

  @override
  void initState() {
    super.initState();
    if (widget.action == RoutineFormAction.edit && widget.initialRoutine != null) {
      selectedIcon = widget.initialRoutine!.taskIcon;
      taskController.text = widget.initialRoutine!.taskTitle;
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
              // Top bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      onPressed: () {
                        if (taskController.text.isNotEmpty) {
                          final newRoutine = Routine(
                            taskTitle: taskController.text,
                            taskIcon: selectedIcon,
                          );
                          widget.onAddRoutine(newRoutine);
                          Navigator.pop(context, newRoutine);
                        }
                      },
                      child: Text(
                        widget.action == RoutineFormAction.edit ? "Save Edit" : "Create", // Change button text based on action
                        style: const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Icon selection
              GestureDetector(
                onTap: () async {
                  final result = await showModalBottomSheet<TaskIcon>(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.73,
                        child: const IconSelectionScreen(),
                      );
                    },
                  );
                  if (result != null) {
                    setState(() {
                      selectedIcon = result;
                    });
                  }
                },
                child: Icon(
                  selectedIcon.icon,
                  color: selectedIcon.color,
                  size: 80,
                ),
              ),
              const SizedBox(height: 20),
              // Task title input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: TextField(
                    controller: taskController,
                    maxLength: 50,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: "New Task",
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    onChanged: (value) {
                      setState(() {
                        charCount = value.length;
                      });
                    },
                  ),
                ),
              ),
              Text("$charCount / 50"),
            ],
          ),
        ),
      ),
    );
  }
}
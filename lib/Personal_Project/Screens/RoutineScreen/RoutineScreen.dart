import 'package:flutter/material.dart';
import 'package:flutter_class/Personal_Project/Model/Enums.dart';
import 'package:flutter_class/Personal_Project/Model/class.dart';
import 'package:flutter_class/Personal_Project/Screens/RoutineScreen/RoutineFormScreen.dart';
import 'package:flutter_class/Personal_Project/Utility/colors.dart';
import 'package:flutter_class/Personal_Project/Widgets/DayCard.dart';
import 'package:flutter_class/Personal_Project/Widgets/TaskCard.dart';
import 'package:slideable/slideable.dart';
import 'package:intl/intl.dart';

class RoutineScreen extends StatefulWidget {
  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  // sample data for routine task
  List<Routine> _routines = [
    Routine(taskTitle: "Drinking Water 2l", taskIcon: TaskIcon.water),
    Routine(taskTitle: "Exercise", taskIcon: TaskIcon.gym),
  ];
  // creating task function
  void _addRoutine() {
    showModalBottomSheet<Routine>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.73,
          child: RoutineFormScreen(
            onAddRoutine: (routine) {
              setState(() {
                _routines.add(routine);
              });
            },
            action: RoutineFormAction.create,
          ),
        );
      },
    );
  }
  // editing task fucntion
  void _editRoutine(Routine routine) {
    showModalBottomSheet<Routine>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.73,
          child: RoutineFormScreen(
            onAddRoutine: (updatedRoutine) {
              int index = _routines.indexOf(routine);
              setState(() {
                _routines[index] = updatedRoutine;
              });
            },
            initialRoutine: routine,
            action: RoutineFormAction.edit,
          ),
        );
      },
    );
  }
  // remove task function
  void _removeRoutine(int index) {
    setState(() {
      _routines.removeAt(index);
    });
  }
  // reorder task list function
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1; // Adjust for removed item
      final routine = _routines.removeAt(oldIndex);
      _routines.insert(newIndex, routine);
    });
  }

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('MMM dd, yyyy').format(DateTime.now());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addRoutine,
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Top section for Date display
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              decoration: BoxDecoration(
                color: blue,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        DayCard(day: "Mon", date: "23", onTap: () {}),
                        DayCard(day: "Tue", date: "24", onTap: () {}),
                        DayCard(day: "Wed", date: "25", onTap: () {}),
                        DayCard(day: "Thu", date: "26", onTap: () {}),
                        DayCard(day: "Fri", date: "27", onTap: () {}),
                        DayCard(day: "Sat", date: "28", onTap: () {}),
                        DayCard(day: "Sun", date: "29", onTap: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Reorderable Task card list
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ReorderableListView(
                  onReorder: _onReorder,
                  children: _routines.map((routine) {
                    int index = _routines.indexOf(routine);
                    return Slideable(
                      key: ValueKey(routine.taskTitle),// key for reodering
                      items: <ActionItems>[
                        ActionItems(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                            size: 40,
                          ),
                          onPress: () => _editRoutine(routine),
                          backgroudColor: Colors.transparent,
                        ),
                        ActionItems(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 40,
                          ),
                          onPress: () => _removeRoutine(index),
                          backgroudColor: Colors.transparent,
                        ),
                      ],
                      child: TaskCard(
                        taskTitle: routine.taskTitle,
                        taskIcon: routine.taskIcon,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
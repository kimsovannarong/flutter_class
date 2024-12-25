import 'package:flutter/material.dart';
import 'package:flutter_class/Personal_Project/Model/Enums.dart';
import 'package:flutter_class/Personal_Project/Model/class.dart';
import 'package:flutter_class/Personal_Project/Screens/ReminderScreen/ReminderFormScreen.dart';
import 'package:flutter_class/Personal_Project/Utility/colors.dart';
import 'package:flutter_class/Personal_Project/Utility/Boxshadow.dart';
import 'package:flutter_class/Personal_Project/Widgets/Remindercard.dart';
import 'package:intl/intl.dart';
import 'package:slideable/slideable.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  int completedCount = 0;//  compltedted work count
  List<Reminder> reminders = [
    Reminder(
      eventTitle: "Trip",
      selectedDate: DateTime.now().subtract(Duration(days: 1)), // Yesterday
      selectedTime: TimeOfDay(hour: 17, minute: 0),
      status: ReminderStatus.Upcoming,
    ),
    Reminder(
      eventTitle: "Submit Project",
      selectedDate: DateTime.now().add(Duration(days: 2)), // In two days
      selectedTime: TimeOfDay(hour: 14, minute: 0),
      status: ReminderStatus.Upcoming,
    ),
    Reminder(
      eventTitle: "Project management Team Meeting",
      selectedDate: DateTime.now().add(Duration(days: 3)), // In three days
      selectedTime: TimeOfDay(hour: 9, minute: 0),
      status: ReminderStatus.Upcoming,
    ),
  ];
  // creating reminder function
  void _addReminder() {
    showModalBottomSheet<Reminder>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.73,
          child: ReminderFormScreen(
            onAddReminder: (newReminder) {
              setState(() {
                reminders.add(newReminder);
              });
            },
            action: ReminderFormAction.create,
          ),
        );
      },
    );
  }
  // editing reminder function
  void _editReminder(Reminder reminder) {
    showModalBottomSheet<Reminder>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.73,
          child: ReminderFormScreen(
            onAddReminder: (updatedReminder) {
              int index = reminders.indexOf(reminder);
              setState(() {
                reminders[index] = updatedReminder;
              });
            },
            initialReminder: reminder,
            action: ReminderFormAction.edit,
          ),
        );
      },
    );
  }
  // remocing reminder function
  void _removeReminder(int index) {
    setState(() {
      reminders.removeAt(index);
    });
  }
  // reodering task function
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1; // Adjust for removed item
      final reminder = reminders.removeAt(oldIndex);
      reminders.insert(newIndex, reminder);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate statistics
    int overdueCount = reminders.where((r) => r.selectedDate!.isBefore(DateTime.now())).length;// overdue reinder count
    int upcomingCount = reminders.where((r) => r.selectedDate!.isAfter(DateTime.now())).length;//upcoming overdue count
    int totalCount = reminders.length;// all task count
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addReminder,
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            // Reminder statistics
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReminderCard(
                        reminderIcon: Icons.calendar_today,
                        number: '$overdueCount',
                        reminderStatus: ReminderStatus.Overdue,
                      ),
                      ReminderCard(
                        reminderIcon: Icons.event,
                        number: '$upcomingCount',
                        reminderStatus: ReminderStatus.Upcoming,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReminderCard(
                        reminderIcon: Icons.list,
                        number: '$totalCount',
                        reminderStatus: ReminderStatus.All,
                      ),
                      ReminderCard(
                        reminderIcon: Icons.done_all,
                        number: '$completedCount',
                        reminderStatus: ReminderStatus.Completed,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // order the reminder by drig drag
            const SizedBox(height: 10),
            Expanded(
              child: ReorderableListView(
                onReorder: _onReorder,
                children: reminders.map((reminder) {
                  int index = reminders.indexOf(reminder);
                  final String formatDate = DateFormat('EEE, d MMM yyyy').format(reminder.selectedDate!);
                  final bool isOverdue = reminder.selectedDate!.isBefore(DateTime.now());
                  final bool isCompleted = reminder.status == ReminderStatus.Completed;

                  return Slideable(
                    key: ValueKey(reminder.eventTitle), // key for reoering
                    items: <ActionItems>[
                      ActionItems(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                          size: 40,
                        ),
                        onPress: () {
                          _editReminder(reminder);
                        },
                        backgroudColor: Colors.transparent,
                      ),
                      ActionItems(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 40,
                        ),
                        onPress: () {
                          _removeReminder(index);
                        },
                        backgroudColor: Colors.transparent,
                      ),
                    ],
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10,horizontal:5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [myboxShadow],
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: ListTile(
                        leading: Icon(Icons.notifications,color: Darkyellow,size: 30,),
                        title: Text(
                          reminder.eventTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: isOverdue ? Colors.red : Colors.black,
                            decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                          ),
                        ),
                        subtitle: Text(
                          "$formatDate, ${reminder.selectedTime!.format(context)}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              if (isCompleted) {
                                _removeReminder(index);
                              } else {
                                reminder.markComplete(); // Update status
                                completedCount++; // Increment completed count
                                _removeReminder(index); // Remove the completed reminder
                              }
                            });
                          },
                          icon: Icon(
                            isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
                            size: 30,
                            color: isCompleted ? Colors.blue : Colors.black26,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
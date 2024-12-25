import 'package:flutter/material.dart';
import 'package:flutter_class/Personal_Project/Model/Enums.dart';
import 'package:uuid/uuid.dart';


class Routine {
  String id;
  String taskTitle;
  bool isCompleted;
  TaskIcon taskIcon;
  String? date;

  Routine({
    required this.taskTitle,
    this.isCompleted = false,
    required this.taskIcon,
  }) : id = Uuid().v4();

  void markCompleted() {
    isCompleted = true;
  }
}

// Reminder class
class Reminder {
  String id;
  String eventTitle;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  ReminderStatus status;

  Reminder({
    required this.eventTitle,
    required this.selectedDate,
    required this.selectedTime,
    this.status = ReminderStatus.Upcoming,
  }) : id = Uuid().v4();

  void markComplete() {
    status = ReminderStatus.Completed;
  }
}

// Journal class
class Journal {
  String id;
  DateTime date;
  String description;
  String quote;
  Mood mood;

  Journal({
    required this.date,
    required this.description,
    required this.quote,
    required this.mood,
  }) : id = Uuid().v4();
}

// System class
class System {
  List<Routine> routines = [];
  List<Reminder> reminders = [];
  List<Journal> journals = [];

  void addTask(Routine task) {
    routines.add(task);
  }

  void deleteTask(Routine task) {
    routines.remove(task);
  }

  void editTask(Routine task) {
    int index = routines.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      routines[index] = task;
    }
  }

  void addReminder(Reminder reminder) {
    reminders.add(reminder);
  }

  void deleteReminder(Reminder reminder) {
    reminders.remove(reminder);
  }

  void editReminder(Reminder reminder) {
    int index = reminders.indexWhere((r) => r.id == reminder.id);
    if (index != -1) {
      reminders[index] = reminder;
    }
  }

  void addJournal(Journal journal) {
    journals.add(journal);
  }

  void deleteJournal(Journal journal) {
    journals.remove(journal);
  }

  void editJournal(Journal journal) {
    int index = journals.indexWhere((j) => j.id == journal.id);
    if (index != -1) {
      journals[index] = journal;
    }
  }
}
import 'package:flutter/material.dart';
enum TaskIcon {
  study(Icons.book, Colors.blue),
  housework(Icons.home, Colors.green),
  gym(Icons.fitness_center, Colors.orange),
  meeting(Icons.meeting_room, Colors.purple),
  shopping(Icons.shopping_cart, Colors.red),
  relaxation(Icons.self_improvement, Colors.teal),
  travel(Icons.flight, Colors.lightBlue),
  bed(Icons.bed, Colors.deepPurple),
  eating(Icons.restaurant, Colors.pink),
  water(Icons.local_drink, Colors.blueAccent), // Corrected entry
  reading(Icons.menu_book, Colors.amber),
  cooking(Icons.kitchen, Colors.brown),
  gardening(Icons.nature, Colors.greenAccent),
  cleaning(Icons.cleaning_services, Colors.grey),
  biking(Icons.directions_bike, Colors.lightGreen),
  walking(Icons.directions_walk, Colors.lime),
  running(Icons.run_circle, Colors.redAccent),
  creativity(Icons.color_lens, Colors.deepOrange),
  music(Icons.music_note, Colors.purpleAccent),
  meditation(Icons.self_improvement, Colors.cyan),
  gaming(Icons.videogame_asset, Colors.indigo);

  final IconData icon;
  final Color color;

  const TaskIcon(this.icon, this.color);
}
enum ReminderStatus{
  Overdue,
  Upcoming,
  All,
  Completed
}
enum Mood {
  happy(Icons.sentiment_very_satisfied, Colors.yellow),
  okay(Icons.sentiment_satisfied, Colors.green),
  sad(Icons.sentiment_dissatisfied, Colors.blue),
  excited(Icons.celebration, Colors.orange),
  grateful(Icons.favorite, Colors.pink),
  exhausted(Icons.battery_alert, Colors.grey),
  angry(Icons.sentiment_very_dissatisfied, Colors.red);

  final IconData icon;
  final Color color;

  const Mood(this.icon, this.color);
}

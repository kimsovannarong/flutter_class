import 'package:flutter/material.dart';
import 'package:flutter_class/Personal_Project/Model/Enums.dart';

class IconSelectionScreen extends StatefulWidget {
  const IconSelectionScreen({super.key});

  @override
  _IconSelectionScreenState createState() => _IconSelectionScreenState();
}

class _IconSelectionScreenState extends State<IconSelectionScreen> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final taskIcons = TaskIcon.values;

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context), // Close the bottom sheet
                ),
                const Text(
                  "Change Icon",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase(); // Update search query and refresh UI
                });
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Select an Icon",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: taskIcons.length,
              itemBuilder: (context, index) {
                final taskIcon = taskIcons[index];
                // filter icon from the search
                if (searchQuery.isNotEmpty &&
                    !taskIcon.name.toLowerCase().contains(searchQuery)) {
                  return const SizedBox();
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context, taskIcon); // closed the form and return the selcted data
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Light grey background
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        taskIcon.icon,
                        size: 32,
                        color: taskIcon.color, // Set icon color from enum
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_class/Personal_Project/Model/Enums.dart'; // Ensure the correct path

class IconMoodSelectionScreen extends StatelessWidget {
  const IconMoodSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moodIcons = Mood.values;
    return Container(
      height: MediaQuery.of(context).size.height * 0.6, // Adjust height if needed
      decoration: BoxDecoration(
        color: Colors.white, // Background color for the bottom sheet
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          // Subtitle
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Select a Mood Icon",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          // Grid of mood icons
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: moodIcons.length,
              itemBuilder: (context, index) {
                final moodIcon = moodIcons[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context, moodIcon); // Return selected icon
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
                        moodIcon.icon, // Use icon from MoodIcon enum
                        size: 32,
                        color: moodIcon.color, // Use color from MoodIcon enum
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

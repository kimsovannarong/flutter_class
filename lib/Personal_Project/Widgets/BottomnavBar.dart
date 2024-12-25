import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class/Personal_Project/Utility/colors.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: blue,
      color: blue,
      animationDuration: const Duration(milliseconds: 500),
      items: <Widget>[
        Icon(Icons.home, size: 25, color: Colors.white,),
        Icon(Icons.notifications, size: 25, color: Colors.white,),
        Icon(Icons.book, size: 25, color: Colors.white,),
        Icon(Icons.person, size: 25, color: Colors.white,),
      ],
      onTap: onTap,
    );
  }

  //   return BottomNavigationBar(
  //     type: BottomNavigationBarType.fixed,
  //     currentIndex: currentIndex,
  //     onTap: onTap,
  //     selectedItemColor: Colors.blue, // Highlight color for selected item
  //     unselectedItemColor: Colors.black54, // Color for unselected items
  //     items: const [
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.home),
  //         label: 'Routine',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.notifications),
  //         label: 'Reminder',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.book),
  //         label: 'Journal',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.person),
  //         label: 'Profile',
  //       ),
  //     ],
  //   );
  // }
}

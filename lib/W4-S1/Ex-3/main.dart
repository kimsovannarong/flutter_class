import 'package:flutter/material.dart';

// Enum for button types
enum ButtonType { primary, secondary, disabled }

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: Text('Custom buttons')
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              CustomButton(
                label: 'Submit',
                icon: Icons.check,
                type: ButtonType.primary,
                iconPositionLeft: true,
              ),
              CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                type: ButtonType.secondary,
                iconPositionLeft: false,
              ),
              CustomButton(
                label: 'Account',
                icon: Icons.account_tree,
                type: ButtonType.disabled,
                iconPositionLeft: false,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool iconPositionLeft;
  final ButtonType type;

  CustomButton({
    Key? key,
    required this.label,
    required this.icon,
    this.iconPositionLeft = true,
    this.type = ButtonType.primary,
  });
  // to access the color based on the type of button
  Color getButtonColor() {
    switch (type) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black26,
          backgroundColor: getButtonColor(),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPositionLeft) Icon(icon,color: Colors.black54,), // Icon on the left if true
            SizedBox(width: 5),// for spacing if the icon is before
            Text(label, style: TextStyle(fontSize: 18,color: Colors.black54)),
            SizedBox(width: 5),// for spacing if the icon is after
            if (!iconPositionLeft) Icon(icon,color: Colors.black54,), // Icon on the right if false
          ],
        ),
      ),
    );
  }
}


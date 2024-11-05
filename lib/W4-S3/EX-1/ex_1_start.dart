import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClickedButton(),
              ClickedButton(),
              ClickedButton(),
              ClickedButton(),
            ],
          )
        ),
      ),
    ));
class ClickedButton extends StatefulWidget {
  const ClickedButton({super.key});

  @override
  State<ClickedButton> createState() => _ClickedButtonState();
}

class _ClickedButtonState extends State<ClickedButton> {
  late bool isSelected= true;
  void Swtiching() {
    setState(() {
      isSelected = !isSelected;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 0),
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
            onPressed: Swtiching,//function to work boolean valuye for switching
            child:  Center(
              child: Text(isSelected? "Selected" :"Notselected",
                style:TextStyle(
                  color: isSelected?Colors.white:Colors.black
                ) ,),
            ),
           style: ElevatedButton.styleFrom(
            backgroundColor: isSelected? Colors.blue.shade500 : Colors.blue.shade50,
        ),
        ),
      ),
    );
  }
}

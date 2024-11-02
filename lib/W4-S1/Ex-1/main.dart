import 'package:flutter/material.dart';

void main() {
  runApp(
     MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Color(0xffEFBBCDFF),
          title: Text("My hobbies"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(title: "Travelling",icon: Icons.travel_explore_rounded,color: Colors.green,),
              SizedBox(
                height: 10,
              ) ,//for vertical spacing in 10 unit
              HobbyCard(title: "Skating",icon: Icons.skateboarding,),
              SizedBox(
                height: 10,
              ) ,//for vertical spacing in 10 unit
              HobbyCard(title: "Biking",icon: Icons.directions_bike_sharp,color: Colors.pink,),
            ],
          ),
        )
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;
  HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.color=Colors.blue
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 20
              ),
              child: Icon(icon,color: Colors.white,),
            ),// padding for the icon element
            Text(title,style: TextStyle(
              color: Colors.white
            ),),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_class/Personal_Project/Screens/MainScreen/MainScreen.dart';
class StartedScreen extends StatelessWidget {
   StartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/PersonalProject/task.png",width: 250,height: 250,),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Simplify, Organize, and Conquer ',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Your Day',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue, // Blue color for "Your Day"
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text("Take control of your tasks and achieve your goals",style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent
                  ),
                  onPressed: ()  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  MainScreen()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Get Started",style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),),
                      Icon(Icons.arrow_forward,color: Colors.white,size: 30,)
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

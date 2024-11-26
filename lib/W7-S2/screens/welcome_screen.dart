import 'package:flutter/material.dart';
import 'package:flutter_class/W7-S2/widgets/app_button.dart';

 class WelcomeScreen extends StatelessWidget {
   final VoidCallback onStart;
   const WelcomeScreen({required this.onStart, super.key, required String title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.blue,
      body: Container(
       child: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/W7-S2/quiz-logo.png",height: 250,width: 250,),
            Text("Crazy Quiz",style: TextStyle(
             color: Colors.white,
             fontWeight: FontWeight.bold,
             fontSize: 40
            ),),
            AppButton("Start quiz",icon: Icons.arrow_forward ,onTap:onStart,)
          ],
         ),
       ),
      ),
    );
  }
}


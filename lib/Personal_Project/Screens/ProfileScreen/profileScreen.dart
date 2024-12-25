import 'package:flutter/material.dart';
import 'package:flutter_class/Personal_Project/Screens/ProfileScreen/SigninScreen.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage("assets/images/PersonalProject/Profile.png"), // Replace with your image path
              backgroundColor: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  SigninScreen()),
                  );
                },
                child: Text("Sign up or Sign in >",style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),)),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

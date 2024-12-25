import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_button.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SignupScreen> {
  bool _isPasswordVisible = false; // for handiling password visibility
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // USername input
                  Row(
                    children: [
                      Icon(Icons.account_box, size: 18, color: Colors.black),
                      const SizedBox(width: 10),
                      Text("Your Username"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    maxLength: 25,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  // Email input
                  Row(
                    children: [
                      Icon(Icons.email, size: 18, color: Colors.black),
                      const SizedBox(width: 10),
                      Text("Your email"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    maxLength: 25,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Password input
                  Row(
                    children: [
                      Icon(Icons.lock, size: 18, color: Colors.black),
                      const SizedBox(width: 10),
                      Text("Password"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: !_isPasswordVisible, // Toggle password visibility
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent
                      ),
                      onPressed: ()  {},
                      child: Text("Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )
                  ),
                  TextButton(onPressed: (){}, child: Text("Already a user ? Sign in",textAlign: TextAlign.end,)),
                  SizedBox(
                    height: 80,
                  ),
                  // social media
                  Column(
                    children: [
                      Center(
                        child: Text(
                          "Or",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ColoredBox(color: Colors.blue),
                          // Icon(color: Colors.blue,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: SocialMediaButton.facebook(
                              url: 'https://facebook.com',
                              size: 30, // Button size
                              color: Colors.white, // Button color
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: SocialMediaButton.instagram(
                              url: 'https://facebook.com',
                              size: 30, // Button size
                              color: Colors.white, // Button color
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: SocialMediaButton.google(
                              url: 'https://facebook.com',
                              size: 30, // Button size
                              color: Colors.white, // Button color
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

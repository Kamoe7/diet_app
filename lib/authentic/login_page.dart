// ignore_for_file: prefer_const_constructors

import 'package:diet_app/authentic/my_buttons.dart';
import 'package:diet_app/authentic/components.dart';
import 'package:diet_app/authentic/my_data/get_login_data.dart';
import 'package:diet_app/authentic/my_image.dart';
import 'package:diet_app/authentic/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user
  void signUser(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignupPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  SizedBox(height: 50),
                  Icon(Icons.lock, size: 100, color: Colors.black),

                  SizedBox(height: 50),

                  //User name
                  Components(
                    hintText: "Username",
                    controller: usernameController,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Components(
                    hintText: "Password",
                    controller: passwordController,
                    obscureText: true,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            signUser(context);
                          },
                          child: Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  //login Up button
                  MyButtons(
                    onTap: () {
                      GetLoginData.loginUser(
                          context: context,
                          username: usernameController.text,
                          password: passwordController.text);
                    },
                    textButton: "Log In",
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey[400],
                          thickness: 0.5,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey[400],
                          thickness: 0.5,
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(height: 20),

                  //google image and apple image

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyImage(myPath: 'assets/images/google.png'),
                      SizedBox(width: 25),
                      MyImage(myPath: 'assets/images/apple.png'),
                    ],
                  ),
                  SizedBox(height: 20),
                  //not a member
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ])),
          ),
        ));
  }
}

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:diet_app/authentic/components.dart';
import 'package:diet_app/authentic/my_buttons.dart';
import 'package:diet_app/authentic/my_data/get_sign_data.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          elevation: 0,
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Icon(Icons.lock, size: 100, color: Colors.black),
                SizedBox(
                  height: 50,
                ),

                //Username
                Components(
                  hintText: "username",
                  controller: usernameController,
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),

                //Password
                Components(
                  hintText: "password",
                  controller: passwordController,
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),

                //confirm Password
                Components(
                  hintText: "confirm password",
                  controller: confirmPasswordController,
                  obscureText: true,
                ),

                SizedBox(
                  height: 50,
                ),

                // sign up button
                MyButtons(
                  onTap: () => GetSignData.registerUser(
                      context: context,
                      username: usernameController.text,
                      password: passwordController.text,
                      confirmPassword: confirmPasswordController.text),
                  textButton: "Sign In",
                )
              ],
            ),
          ),
        )));
  }
}

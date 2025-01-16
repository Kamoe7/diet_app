import 'package:diet_app/flutterUI/food.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DietApp());
}

class DietApp extends StatelessWidget {
  const DietApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FoodPage(),
        /* initialRoute: '/',
        routes: {
          '/':(context)=>LoginPage(),
          '/home':(context)=>DietHomePage()
          
        },*/
        theme: ThemeData(
            primaryColor: Colors.blue,
            hintColor: Colors.lightBlueAccent,
            textTheme: TextTheme(
              bodyMedium: TextStyle(color: Colors.black87, fontSize: 16),
            )));
  }
}

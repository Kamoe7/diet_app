import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final String myPath;
  const MyImage({super.key, required this.myPath});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200]),
        child: Image.asset(
          myPath,
          height: 50,
        ));
  }
}

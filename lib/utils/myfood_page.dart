import 'package:flutter/material.dart';

class MyfoodPage extends StatefulWidget {
  const MyfoodPage({super.key});

  @override
  State<MyfoodPage> createState() => _MyfoodPageState();
}

class _MyfoodPageState extends State<MyfoodPage> {
  final List<Map<String, String>> myFoodItems = [
    {"name": "Banana", "details": "122 Cal, 1 banana"},
    {"name": "Egg", "details": "71 Cal, 1 medium"},
    {"name": "Ferrero Rocher Chocolate", "details": "77 Cal, 1 pieces"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: myFoodItems.length,
        itemBuilder: (context, index) {
          final item = myFoodItems[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            title: Text(
              item['name']!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(item['details']!),
            trailing: Icon(
              Icons.add_circle_outline,
              color: Colors.blue,
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';

class MymealPage extends StatefulWidget {
  const MymealPage({super.key});

  @override
  State<MymealPage> createState() => _MymealPageState();
}

class _MymealPageState extends State<MymealPage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> mealItems = [
      {"name": "Breakfast", "details": "300 Cal"},
      {"name": "Lunch", "details": "600 Cal"},
      {"name": "Dinner", "details": "500 Cal"},
    ];

    return ListView.builder(
      itemCount: mealItems.length,
      itemBuilder: (context, index) {
        final meal = mealItems[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Text(meal['name']!,
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(meal['details']!),
        );
      },
    );
  }
}

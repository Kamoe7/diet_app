import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final List<Map<String, String>> historyItems = [
    {"name": "Takis Fuego", "details": "180 Cal, 1 package"},
    {"name": "Chicken Breast", "details": "185 Cal, 1 small breast"},
    {"name": "Ferrero Rocher Chocolate", "details": "77 Cal, 1 pieces"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: historyItems.length,
      itemBuilder: (context, index) {
        final item = historyItems[index];
        return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            title: Text(item['name']!,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(item['details']!),
            trailing: Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
            onTap: () {
              setState(() {
                historyItems.removeAt(index);
              });
            });
      },
    );
  }
}

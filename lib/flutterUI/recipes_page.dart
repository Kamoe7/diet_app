// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, use_super_parameters, prefer_final_fields

import 'package:diet_app/utils/button_trans.dart';
import 'package:diet_app/utils/history_page.dart';
import 'package:diet_app/utils/myfood_page.dart';
import 'package:diet_app/utils/mymeal_page.dart';
import 'package:flutter/material.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  int _currentTabIndex = 0;

  final List<Map<String, String>> foodItems = [
    {"name": "Ban", "details": "122 Cal, 1 banana"},
    {"name": "Egg", "details": "71 Cal, 1 medium"},
    {"name": "Peanut Butter", "details": "102 Cal, 1 tbsp"},
    {"name": "Takis Fuego", "details": "180 Cal, 1 package"},
    {"name": "Chicken Breast", "details": "185 Cal, 1 small breast"},
    {"name": "Ferrero Rocher Chocolate", "details": "77 Cal, 1 pieces"},
  ];

  Widget _buildTabContent() {
    switch (_currentTabIndex) {
      case 0:
        return _buildFoodList();
      case 1:
        return HistoryPage();
      case 2:
        return MyfoodPage();
      case 3:
        return MymealPage();
      default:
        return Center(child: Text('No content found'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Snacks',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          )
        ]),
        centerTitle: true,
      ),
      body: Column(children: [
        _buildSearchBar(),
        SizedBox(height: 8),
        ButtonTrans(onButtonSelected: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        }),
        SizedBox(
          height: 16,
        ),
        _buildActionInsideButton(),
        SizedBox(
          height: 16,
        ),
        Expanded(child: _buildTabContent())
      ]),
    );
  }

//Search bar

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
          decoration: InputDecoration(
              labelText: 'Search for foods',
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none))),
    );
  }

/*  Widget _buildTextButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonTrans(onButtonSelected: (index) {
          switch (index) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ForyouPage()));
          }
        })
      ],
    );
  }*/

//Action buttons below search bar
  Widget _buildActionInsideButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(
          Icons.camera_alt_outlined,
          "Scan Food",
          Colors.yellow.shade100,
        ),
        _buildActionButton(
          Icons.qr_code_scanner,
          "Barcode",
          Colors.green.shade100,
        ),
        _buildActionButton(
          Icons.mic_outlined,
          "Say Food",
          Colors.blue.shade100,
        ),
        _buildActionButton(
            Icons.note_alt_outlined, "Quick Log", Colors.orange.shade100)
      ],
    );
  }

// Action buttons design
  Widget _buildActionButton(IconData icon, String label, Color color,
      {VoidCallback? onPressed}) {
    return Container(
      width: 80,
      height: 80,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black87),
            SizedBox(
              height: 8,
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

//For you page tab content:Food list
  Widget _buildFoodList() {
    return ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final food = foodItems[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            title: Text(food['name']!,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(food['details']!),
            trailing: IconButton(
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.blue,
              ),
              onPressed: () {},
            ),
          );
        });
  }
}

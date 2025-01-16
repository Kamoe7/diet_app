// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_element, use_super_parameters

import 'package:flutter/material.dart';

class ButtonTrans extends StatefulWidget {
  final Function(int) onButtonSelected;
  const ButtonTrans({Key? key, required this.onButtonSelected})
      : super(key: key);

  @override
  State<ButtonTrans> createState() => _ButtonTransState();
}

class _ButtonTransState extends State<ButtonTrans> {
  int _selectedIndex = 0;

  final List<String> tabs = ['For You', 'History', 'MyFood', 'My Meal'];

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(tabs.length, (index) {
          final bool isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              widget.onButtonSelected(index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(tabs[index],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? Colors.blue : Colors.black54)),
                if (isSelected)
                  Container(
                      margin: EdgeInsets.only(top: 4),
                      height: 3,
                      width: 30,
                      color: Colors.blue)
              ],
            ),
          );
        }));
  }
}

import 'dart:convert';

import 'package:diet_app/authentic/my_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  List<dynamic> _foods = [];
  List<dynamic> _filteredFoods = [];
  bool _isLoading = true;
  Map<String, List<dynamic>> _mealCategories = {
    'Breakfast': [],
    'Lunch': [],
    'Dinner': [],
    'Snacks': []
  };
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchFoodData();
    _searchController.addListener(_filterFoods);
  }

  Future<void> _fetchFoodData() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:5000/auth/food'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success']) {
          print('success');
          setState(() {
            _foods = data['foods'];
            _filteredFoods = _foods; //initialize filtered list
            _isLoading = false;
          });
        } else {
          throw Exception(data['error']);
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error:$e');
    }
  }

  void _filterFoods() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredFoods = _foods
          .where((food) => food['name'].toLowerCase().contains(query))
          .toList();
    });
  }

  //method  to add selected food to the corresponding meal category
  void _addFoodToMealCategory(String meal, Map<String, dynamic> food) {
    setState(() {
      _mealCategories[meal]?.add(food);
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("${food['name']} added!")));
  }

  void _showMealCategoryDialog(
      BuildContext context, Map<String, dynamic> food) {
    showModalBottomSheet(
        backgroundColor: const Color.fromARGB(255, 184, 215, 241),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Select a meal category to add "${food['name']}"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 1, 1, 20)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ..._mealCategories.keys.map((Category) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(
                            Category,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          trailing: MyImage(myPath: 'assets/images/dish.png'),
                          onTap: () {
                            _addFoodToMealCategory(Category, food);
                            Navigator.pop(context);
                          },
                        ));
                  }).toList(),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 182, 214, 240),
          title: Text(
            'My Food',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                      hintText: 'Search for food...',
                      icon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 250, 245, 245)),
                ),
              )),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _filteredFoods.isEmpty
                ? Center(child: Text('No foods available'))
                : ListView.builder(
                    itemCount: _filteredFoods.length,
                    itemBuilder: (context, index) {
                      final food = _filteredFoods[index];
                      return ListTile(
                          title: Text(food['name']),
                          subtitle: Text(
                              "calories:${food['calories']} | Protein:${food['protein']}g"),
                          trailing: Icon(Icons.add,
                              color: const Color.fromARGB(255, 22, 26, 243)),
                          onTap: () {
                            _showMealCategoryDialog(context, food);
                          });
                    }));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

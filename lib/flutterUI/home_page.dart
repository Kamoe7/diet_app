// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:diet_app/flutterUI/recipes_page.dart';
import 'package:flutter/material.dart';

class DietHomePage extends StatefulWidget {
  const DietHomePage({super.key});

  @override
  State<DietHomePage> createState() => _DietHomePageState();
}

class _DietHomePageState extends State<DietHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 239, 245),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 217, 239, 245),
        elevation: 0,
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/images/robot.png'),
        ),
        title: Text(
          "Chat with Bot",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_fire_department,
                  color: Colors.red,
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBalanceDietSection(),
            _buildTitle(),
            _buildEatenSection(),
            _buildCaloriesBurnedSection(),
            _buildWaterAndWeightSection(),
            _buildCaloriesBurnedSection()
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(23, 8, 231, 1),
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBalanceDietSection() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 244, 246, 247),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Balanced Diet:2900 Cal",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "0 Cal Eaten",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                "2900 Cal left",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCaloriesBurnedSection() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color.fromARGB(253, 237, 242, 245),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Calories Burnes",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text("0 cal") // i need to get this text from burned calories
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Steps walked",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  "0/4000") //get this from step walk and instead of 4k count how much step i need
            ],
          )
        ],
      ),
    );
  }

  Widget _buildWaterAndWeightSection() {
    return Row(
      children: [
        Expanded(child: _buildCard("Water", "0 fl oz", "Goal: 64 fl oz")),
        Expanded(child: _buildCard("Weight", "70.7 kg", "BMI: 24.5"))
      ],
    );
  }

  Widget _buildCard(String title, String value, String subtitle) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 245, 245),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: 8,
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4,
          ),
          Text(subtitle)
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Eaten",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          "Choose a plan",
          style: TextStyle(fontWeight: FontWeight.w100),
        )
      ],
    );
  }

  Widget _buildEatenSection() {
    return Column(
      children: [
        _buildMealTile("Breakfast", 725),
        _buildMealTile("Lunch", 870),
        _buildMealTile("Dinner", 841),
        _buildMealTile("Snacks", 404),
      ],
    );
  }

  Widget _buildMealTile(String meal, int calories) {
    return ListTile(
      leading: Icon(
        Icons.food_bank,
        color: const Color.fromARGB(255, 70, 100, 235),
      ),
      title: Text(meal),
      subtitle: Text("0/$calories Cal"),
      trailing: Icon(
        Icons.add_circle,
        color: const Color.fromARGB(255, 7, 23, 243),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: const Color.fromARGB(255, 212, 212, 245),
      notchMargin: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          SizedBox(
            width: 40,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RecipesPage()));
              },
              icon: Icon(Icons.restaurant_menu)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person))
        ],
      ),
    );
  }
}

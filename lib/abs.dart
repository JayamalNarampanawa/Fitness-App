import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'settings.dart';
import 'meal.dart';

class AbsScreen extends StatefulWidget {
  @override
  _AbsScreenState createState() => _AbsScreenState();
}

class _AbsScreenState extends State<AbsScreen> {
  int _currentIndex = 1;

  final List<Map<String, String>> exercises = [
    {'name': 'Heel Tap', 'time': '30s'},
    {'name': 'Mountain Climbers', 'time': '30s'},
    {'name': 'Russian Twist', 'time': '30s'},
    {'name': 'Side Plank with Leg Raise', 'time': '30s'},
    {'name': 'Jack Knife Crunch', 'time': '30s'},
    {'name': 'plank', 'time': '30s'},
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
        break;
      case 1:
        // Current screen
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => MealScreen()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.9,
              child: Image.asset('assets/home.jpeg', fit: BoxFit.cover),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jayamal Narampanawa",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/j.jpg'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      "Abs Workout",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/abs.jpg',
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${exercises.length} Exercises",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.fitness_center, color: Colors.white),
                            title: Text(exercises[index]["name"]!, style: TextStyle(color: Colors.white)),
                            trailing: Text(
                              exercises[index]["time"]!,
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {},
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: "Workout"),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: "Diet"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}

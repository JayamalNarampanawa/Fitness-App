// IMPORTING PACKAGES
import 'package:flutter/material.dart';
import 'package:fitness_app/tricepPushUps.dart';
import 'package:fitness_app/inchworm.dart';
import 'package:fitness_app/plank.dart';
import 'package:fitness_app/BandBicepCurls.dart';
import 'package:fitness_app/plankWalk.dart';
import 'dashboard.dart';
import 'settings.dart';
import 'meal.dart';
import 'profile.dart';

class ArmsScreen extends StatefulWidget {
  @override
  _ArmsScreenState createState() => _ArmsScreenState();
}

class _ArmsScreenState extends State<ArmsScreen> {
  int _currentIndex = 1;

// Exercise list
  final List<Map<String, String>> exercises = [
    {'name': 'Tricep Dips', 'time': '30s'},
    {'name': 'Inchworm', 'time': '30s'},
    {'name': 'Plank', 'time': '30s'},
    {'name': 'Band Bicep Curls', 'time': '30s'},
    {'name': 'Plank Walk', 'time': '30s'},
  ];

// Bottom navigation tap handling
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
        break;
      case 1:
        // Stay here (Workout screen)
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => MealScreen()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
        break;
    }
  }

// Navigate to workout screens
  void _navigateToExercise(String name) {
    switch (name) {
      case 'Tricep Dips':
        Navigator.push(context, MaterialPageRoute(builder: (context) => tricepScreen()));
        break;
      case 'Inchworm':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Inchworm()));
        break;
      case 'Plank':
        Navigator.push(context, MaterialPageRoute(builder: (context) => plankScreen()));
        break;
      case 'Band Bicep Curls':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Bandbicepcurls()));
        break;
      case 'Plank Walk':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Plankwalk()));
        break;
    }
  }

// Navigate to profile screen
  void _navigateToProfile() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen()));
  }

// UI decoration
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
                // Profile section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: _navigateToProfile,
                        child: Text(
                          "Jayamal Narampanawa",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        onTap: _navigateToProfile,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/j.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),

                // Heading
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      "Arms Workout",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ),

                // Workout main image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/arm.jpg',
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Number of workouts
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

                // Workout list
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
                            title: Text(
                              exercises[index]['name']!,
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: Text(
                              exercises[index]['time']!,
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () => _navigateToExercise(exercises[index]['name']!.trim()),
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

      // Bottom navigation bar
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

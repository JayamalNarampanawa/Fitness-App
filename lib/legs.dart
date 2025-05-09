//import packasges
import 'package:fitness_app/profile.dart';
import 'package:flutter/material.dart';
//importing screens
import 'dashboard.dart';
import 'settings.dart';
import 'meal.dart';
import 'squats.dart';
import 'lungues.dart';
import 'squatJack.dart';
import 'sumoSquat.dart';
import 'crossOverLungues.dart';

class LegsScreen extends StatefulWidget {
  @override
  _LegsScreenState createState() => _LegsScreenState();
}

class _LegsScreenState extends State<LegsScreen> {
  int _currentIndex = 1;
//workout list with time
  final List<Map<String, String>> exercises = [
    {'name': 'Classic Squat', 'time': '30s'},
    {'name': 'Jumping Lunges', 'time': '30s'},
    {'name': 'Jumping Squats', 'time': '30s'},
    {'name': 'Sumo Squats', 'time': '30s'},
    {'name': 'Reverse Lunges', 'time': '30s'},
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
//BNB Navigation
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
        break;
      case 1:
        
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => MealScreen()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
        break;
    }
  }
//Workouts navighation
  void _navigateToExercise(String name) {
    switch (name) {
      case 'Classic Squat':
        Navigator.push(context, MaterialPageRoute(builder: (context) => SquatScreen()));
        break;
      case 'Jumping Lunges':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Lungues()));
        break;
      case 'Jumping Squats':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Squatjack()));
        break;
      case 'Sumo Squats':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Sumosquat()));
        break;
      case 'Reverse Lunges':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Crossoverlungues()));
        break;
    }
  }
//profile navigation
  void _navigateToProfile() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen()));
  }
//UI
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
          //profile area
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                //title
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      "Legs Workout",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ),
                //workout image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/legs.jpg',
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                //no. of exercies
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
                      final exerciseName = exercises[index]["name"]!;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.fitness_center, color: Colors.white),
                            title: Text(exerciseName, style: TextStyle(color: Colors.white)),
                            trailing: Text(
                              exercises[index]["time"]!,
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () => _navigateToExercise(exerciseName),
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
      //BNB attributes
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

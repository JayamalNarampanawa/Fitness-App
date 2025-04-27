import 'package:fitness_app/profile.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'settings.dart';
import 'meal.dart';
import 'jumpingjacks.dart';
import 'wallSit.dart';
import 'pushUps.dart';
import 'crunches.dart';
import 'squats.dart';
import 'tricepPushUps.dart';
import 'plank.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: FullBodyWorkoutScreen(),
    );
  }
}

class FullBodyWorkoutScreen extends StatefulWidget {
  @override
  _FullBodyWorkoutScreenState createState() => _FullBodyWorkoutScreenState();
}

class _FullBodyWorkoutScreenState extends State<FullBodyWorkoutScreen> {
  int _currentIndex = 1;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
//BNB
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
//navigate to profile on profile pic ouch
  void _navigateToEditProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfileScreen()),
    );
  }
//workout list
  final List<Map<String, String>> exercises = [
    {"name": "Jumping Jacks", "time": "30s"},
    {"name": "Wall Sit", "time": "30s"},
    {"name": "Push-Ups", "time": "30s"},
    {"name": "Crunches", "time": "30s"},
    {"name": "Squats", "time": "30s"},
    {"name": "Tricep Dips", "time": "30s"},
    {"name": "Plank", "time": "30s"},
  ];
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
          //Profile Area
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
                        onTap: _navigateToEditProfile,
                        child: Text(
                          "Jayamal Narampanawa",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        onTap: _navigateToEditProfile,
                        child: CircleAvatar(backgroundImage: AssetImage('assets/j.jpg')),
                      ),
                    ],
                  ),
                ),
                //title
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      "Full body workout",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ),
                //workout image
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/fullbody.jpeg', height: 150, width: double.infinity, fit: BoxFit.cover),
                  ),
                ),
                //no. of exercises
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "7 Exercises",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      String name = exercises[index]["name"]!;
                      String time = exercises[index]["time"]!;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          //navigating to teh workout screens on user touch
                          child: ListTile(
                            leading: Icon(Icons.fitness_center, color: Colors.white),
                            title: Text(name, style: TextStyle(color: Colors.white)),
                            trailing: Text(time, style: TextStyle(color: Colors.white)),
                            onTap: () {
                              if (name == "Jumping Jacks") {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => JumpingJacksScreen()));
                              } else if (name == "Wall Sit") {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => WallSitScreen()));
                              } else if (name == "Push-Ups") {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PushUpsScreen()));
                              } else if (name == "Crunches") {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => crucnhesScreen()));
                              } else if (name == "Squats") {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SquatScreen()));
                              } else if (name == "Tricep Dips") {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => tricepScreen()));
                              } else if (name == "Plank") {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => plankScreen()));
                              }
                            },
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: "Home Workout"),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: "Diet"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}

//importing packages
import 'package:fitness_app/profile.dart';
import 'package:flutter/material.dart';
//importin screens
import 'dashboard.dart';
import 'meal.dart';
import 'settings.dart';
import 'fullBody.dart';
import 'chest.dart';
import 'arm.dart';
import 'abs.dart';
import 'legs.dart';
import 'back.dart';
import 'yoga.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeWorkoutScreen(),
    );
  }
}

class HomeWorkoutScreen extends StatefulWidget {
  @override
  State<HomeWorkoutScreen> createState() => _HomeWorkoutScreenState();
}
//workout categories
class _HomeWorkoutScreenState extends State<HomeWorkoutScreen> {
  final List<String> categories = [
    "Full Body",
    "Chest",
    "Arms",
    "Abs",
    "Legs",
    "Back",
    "Yoga"
  ];

  int _currentIndex = 1;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
//BNB navigation
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MealScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsScreen()),
        );
        break;
    }
  }
//Workout Navigation
  void _navigateToWorkout(int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (_) => FullBodyWorkoutScreen()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (_) => Chestscreen()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ArmsScreen()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (_) => AbsScreen()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (_) => LegsScreen()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (_) => BackScreen()));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (_) => YogaScreen()));
        break;
    }
  }
//profile navigation
  void _navigateToEditProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfileScreen()),
    );
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
              child: Image.asset(
                'assets/home.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          //PROFILE AREA
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
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _navigateToEditProfile,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/j.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),
                //  Title
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Center(
                    child: Text(
                      "Home Workout",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.tealAccent,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Workout categories list
                Expanded(
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Text(categories[index], style: TextStyle(color: Colors.white)),
                            trailing: Icon(Icons.play_arrow, color: Colors.white),
                            onTap: () => _navigateToWorkout(index),
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

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: "Home Workout"),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: "Diet"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}

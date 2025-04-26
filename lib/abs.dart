//importing packages
import 'package:fitness_app/MountainClimbers.dart';
import 'package:fitness_app/heeltap.dart';
import 'package:fitness_app/russianTwist.dart';
import 'package:flutter/material.dart';

//importing screens
import 'dashboard.dart';
import 'settings.dart';
import 'meal.dart';
import 'sidePlank.dart';
import 'JackKnifeCrunch.dart';
import 'plank.dart';
import 'profile.dart'; 

class AbsScreen extends StatefulWidget {
  @override
  _AbsScreenState createState() => _AbsScreenState();
}

class _AbsScreenState extends State<AbsScreen> {
  int _currentIndex = 1;
// exercises list
  final List<Map<String, String>> exercises = [
    {'name': 'Heel Tap', 'time': '30s'},
    {'name': 'Mountain Climbers', 'time': '30s'},
    {'name': 'Russian Twist', 'time': '30s'},
    {'name': 'Side Plank', 'time': '30s'},
    {'name': 'Jack Knife Crunch', 'time': '30s'},
    {'name': 'Plank', 'time': '30s'},
  ];

//Navigation of BNB (Bottom Navigation Bar)
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
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
//Navigation of workouts
  void _navigateToExercise(String name) {
    switch (name) {
      case 'Heel Tap':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Heeltap()));
        break;
      case 'Mountain Climbers':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Mountainclimbers()));
        break;
      case 'Russian Twist':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Russiantwist()));
        break;
      case 'Side Plank':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Sideplank()));
        break;
      case 'Jack Knife Crunch':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Jackknifecrunch()));
        break;
      case 'Plank':
        Navigator.push(context, MaterialPageRoute(builder: (context) => plankScreen()));
        break;
    }
  }

  void _navigateToProfile() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen()));
  }


//decorating UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.9,
              child: Image.asset('assets/home.jpeg',
               fit: BoxFit.cover),
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

                //heading
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      "Abs Workout",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ),

                //image for abs
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
                      "${exercises.length} Exercises",//no. of exercises
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
                            onTap: () => _navigateToExercise(exercises[index]["name"]!.trim()),
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

      //BNB decoration
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

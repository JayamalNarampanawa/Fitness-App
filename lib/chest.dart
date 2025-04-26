//IMPORTING MY PACKAGES
import 'package:fitness_app/declinePushUps.dart';
import 'package:fitness_app/plankWShoulderTaps.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'settings.dart';
import 'meal.dart';
import 'DiamondPushUps.dart';
import 'inclinePushUps.dart';
import 'pushUps.dart';
import 'profile.dart'; 

class Chestscreen extends StatefulWidget {
  @override
  _ChestscreenState createState() => _ChestscreenState();
}

class _ChestscreenState extends State<Chestscreen> {
  int _currentIndex = 1;
//list
  final List<Map<String, String>> exercises = [
    {'name': 'Diamond Push Ups', 'time': '20s'},
    {'name': 'Incline Push Ups', 'time': '20s'},
    {'name': 'Push Ups', 'time': '20s'},
    {'name': 'Decline Push Ups', 'time': '20s'},
    {'name': 'Push Ups With Shoulder Tap', 'time': '20s'},
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
//BNB nav
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
//workout nav
  void _navigateToExercise(String name) {
    switch (name) {
      case 'Diamond Push Ups':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Diamondpushups()));
        break;
      case 'Incline Push Ups':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Inclinepushups()));
        break;
      case 'Push Ups':
        Navigator.push(context, MaterialPageRoute(builder: (context) => PushUpsScreen()));
        break;
      case 'Decline Push Ups':
        Navigator.push(context, MaterialPageRoute(builder: (context) => DeclinePushUps()));
        break;
      case 'Push Ups With Shoulder Tap':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Plankwshouldertaps()));
        break;
    }
  }

  void _navigateToProfile() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen()));
  }


//UI deco
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
          //proflie
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
                      "Chest Workout",
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
                      'assets/chest.jpeg',
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //no.of workouts
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
                //  ATRIBUTES OF WORKOUTS LIST
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
                            trailing: Text(exercises[index]["time"]!, style: TextStyle(color: Colors.white)),
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

      //BNB
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

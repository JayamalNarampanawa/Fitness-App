//importing packages and screens
import 'package:fitness_app/Profile.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'settings.dart';
import 'homeschedule.dart';
import 'weightLoss.dart';
import 'weightGain.dart';
import 'maintain.dart';


void main() => runApp(MealApp());

class MealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal',
      theme: ThemeData.dark(),
      home: MealScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MealScreen extends StatefulWidget {
  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  int _currentIndex = 2;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
//BNB Navigation
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeWorkoutScreen()),
        );
        break;
      case 2:
        
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsScreen()),
        );
        break;
    }
  }

  // Navigate to EditProfile screen when profile icon or name is tapped
  void _navigateToProfile() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen()));
  }
//UI
    //BG
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.4,
              child: Image.asset(
                'assets/home.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          //profile area
            //name
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: _navigateToProfile,
                        child: Text(
                          'Jayamal Narampanawa',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      //profile icon
                      GestureDetector(
                        onTap: _navigateToProfile,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/j.jpg'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 160),

                  // Meal Options
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WeightLossMealPlanApp()),
                      );
                    },
                    //weight loss
                    child: MealOption(
                      title: 'Weight loss meal plan',
                      icon: Icons.fitness_center,
                      imageAsset: 'assets/wLose.png',
                    ),
                  ),
                  SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WeightGainMealPlanScreen()),
                      );
                    },
                    //weight gain
                    child: MealOption(
                      title: 'Weight gain meal plan',
                      icon: Icons.accessibility,
                      imageAsset: 'assets/Wgain.png',
                    ),
                  ),
                  SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MaintenanceMealPlanApp()),
                      );
                    },
                    //maintain
                    child: MealOption(
                      title: 'Body Maintain meal plan',
                      icon: Icons.monitor_heart,
                      imageAsset: 'assets/maintain.jpg',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
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
//variable declaration
class MealOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final String imageAsset;

  const MealOption({
    required this.title,
    required this.icon,
    required this.imageAsset,
  });
//image attributes
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(
            imageAsset,
            height: 40,
            width: 40,
          ),
          SizedBox(width: 15),
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.white),
          )
        ],
      ),
    );
  }
}

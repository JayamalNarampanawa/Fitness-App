import 'package:fitness_app/aboutus.dart';
import 'package:fitness_app/contact.dart';
import 'package:fitness_app/locate.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'meal.dart';
import 'homeschedule.dart';
import 'profile.dart';
import 'login.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _currentIndex = 3;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeWorkoutScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MealScreen()),
        );
        break;
      case 3:
        // current screen
        break;
    }
  }

  void _handleLogout() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Thank You. See you soon!"),
        duration: Duration(seconds: 2),
      ),
    );
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/home.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(context, Icons.person, "Edit Profile", () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfileScreen()));
                }),
                _buildButton(context, Icons.phone, "Contact Us", () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ContactUsScreen()));
                }),
                _buildButton(context, Icons.info, "About Us", () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AboutUsScreen()));
                }),
                _buildButton(context, Icons.location_on, "Locate Us", () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => LocateUsScreen()));
                }),
                _buildButton(context, Icons.logout, "Logout", _handleLogout),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Delete Account",
                    style: TextStyle(color: Colors.red, fontSize: 16),
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

  Widget _buildButton(BuildContext context, IconData icon, String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: 250,
        height: 55,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.withOpacity(0.7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          icon: Icon(icon, color: Colors.white),
          label: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

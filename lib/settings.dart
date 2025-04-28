//importng screens and packages
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
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
        break;
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeWorkoutScreen()));
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MealScreen()));
        break;
      case 3:
        
        break;
    }
  }
//method for log out
  void _handleLogout() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        //greeting
        content: Text("Thank You. See you soon!"),
        duration: Duration(seconds: 2),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }
//method to delete account
  void _confirmDeleteAccount() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text("Delete Account", style: TextStyle(color: Colors.redAccent)),
        content: const Text(
          "Are you sure you want to delete your account?",
          style: TextStyle(color: Colors.white70),
        ),
        //take confirmation (yes/no)
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("No", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _askReasonBeforeDelete();
            },
            child: const Text("Yes", style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }
//method to get reason
  void _askReasonBeforeDelete() {

    //
    TextEditingController reasonController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text("We're sorry to see you go", style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Would you like to tell us why you're leaving?",
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: reasonController,
              maxLines: 3,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Your reason (optional)",
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _finalizeAccountDeletion(reasonController.text);
            },
            child: const Text("Submit", style: TextStyle(color: Colors.blueAccent)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _finalizeAccountDeletion(); // no reason
            },
            child: const Text("Skip", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _finalizeAccountDeletion([String? reason]) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(color: Colors.redAccent),
                SizedBox(height: 16),
                Text("Deleting account...", style: TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
          ),
        );
      },
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Close loading dialog

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("We're sorry to see you go."),
          backgroundColor: Colors.redAccent,
        ),
      );

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/home.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //list on the screen and navigation
          Container(color: Colors.black.withOpacity(0.6)),
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
                const SizedBox(height: 20),
                TextButton(
                  onPressed: _confirmDeleteAccount,
                  child: const Text("Delete Account", style: TextStyle(color: Colors.red, fontSize: 16)),
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
        items: const [
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          icon: Icon(icon, color: Colors.white),
          label: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );
  }
}

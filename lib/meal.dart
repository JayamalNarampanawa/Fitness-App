import 'package:flutter/material.dart';


void main() => runApp(MealApp());

class MealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'meal',
      theme: ThemeData.dark(),
      home: MealScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Opacity(
              opacity: 0.4,
              child: Image.asset(
                'assets/home.jpeg', // <- Replace with your asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  // Header with name and profile
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jayamal Narampanawa',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/j.jpg'), // <- Replace with your profile asset
                      ),
                    ],
                  ),
                  SizedBox(height: 160),
                  
                  // Meal Plan Options
                  MealOption(
                    title: 'Weight loss meal plan',
                    icon: Icons.fitness_center,
                    imageAsset: 'assets/wLose.png',
                  ),
                  SizedBox(height: 50),
                  MealOption(
                    title: 'Weight gain meal plan',
                    icon: Icons.accessibility,
                    imageAsset: 'assets/Wgain.png',
                  ),
                  SizedBox(height: 50),
                  MealOption(
                    title: 'Maintenance meal plan',
                    icon: Icons.monitor_heart,
                    imageAsset: 'assets/maintain.jpg',
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
    );
  }
}

class MealOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final String imageAsset;

  const MealOption({
    required this.title,
    required this.icon,
    required this.imageAsset,
  });

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

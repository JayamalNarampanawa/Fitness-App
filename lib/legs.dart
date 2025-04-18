import 'package:flutter/material.dart';

class LegsScreen extends StatelessWidget {
  final List<Map<String, String>> exercises = [
    {'name': 'Goblet Squat', 'time': '30s'},
    {'name': 'Pendulum Lunges', 'time': '30s'},
    {'name': 'Classic Squats', 'time': '30s'},
    {'name': 'Step-Ups', 'time': '30s'},
    {'name': 'Hip Bridges', 'time': '30s'},
    {'name': 'Single-leg Deadlifts', 'time': '30s'},
    {'name': 'Touch Down Jacks', 'time': '30s'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader('Legs', 'assets/legs.jpg'),
            Expanded(
              child: ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      exercises[index]['name']!,
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Text(
                      exercises[index]['time']!,
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String title, String imagePath) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.grey[900],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
      ],
    );
  }
}

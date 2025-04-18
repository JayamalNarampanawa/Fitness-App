import 'package:flutter/material.dart';

class BackScreen extends StatelessWidget {
  final List<Map<String, String>> exercises = [
    {'name': 'T Raises', 'time': '30s'},
    {'name': 'Single-Arm Dumbbell Row', 'time': '30s'},
    {'name': 'Delt Raise', 'time': '30s'},
    {'name': 'Push-Up Hold', 'time': '30s'},
    {'name': 'Twister', 'time': '30s'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader('Back', 'assets/back.jpg'),
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

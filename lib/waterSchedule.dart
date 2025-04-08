import 'dart:ui';
import 'package:flutter/material.dart';

class WaterSchedule extends StatelessWidget {
  final List<Map<String, String>> schedule = [
    {"time": "7:00 – 1st Glass", "desc": "Drink your first glass of water after you wake up to hydrate your body after a long night’s rest. Take your breakfast at least half an hour after the first glass."},
    {"time": "9:00 – 2nd Glass", "desc": "It’s approximately 1 hour after your breakfast; have a glass of water and start your work day."},
    {"time": "11:30 – 3rd Glass", "desc": "Have a glass of water 30 minutes before lunch."},
    {"time": "13:30 – 4th Glass", "desc": "Drink a glass of water an hour after lunch to allow the nutrients from the food to be better absorbed by your body."},
    {"time": "15:00 – 5th Glass", "desc": "During your tea break, have a non-sweetened drink (water!) to freshen your mind."},
    {"time": "17:00 – 6th Glass", "desc": "This glass of water will keep you satiated and prevent overeating during dinner."},
    {"time": "20:00 – 7th Glass", "desc": "Have a glass of water an hour after dinner and before you shower."},
    {"time": "22:00 – 8th Glass", "desc": "Drink your last glass of water an hour before bedtime to aid in the cell renewal process during your sleep."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/home.jpeg', // Use your uploaded image
              fit: BoxFit.cover,
            ),
          ),
          // Blur layer
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Daily Water Drinking Schedule",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: schedule.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              schedule[index]["time"]!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              schedule[index]["desc"]!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
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
    );
  }
}

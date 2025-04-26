import 'package:flutter/material.dart';

void main() => runApp(WeightLossMealPlanApp());

class WeightLossMealPlanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weight Loss Meal Plan',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: WeightLossMealPlanScreen(),
    );
  }
}

class WeightLossMealPlanScreen extends StatelessWidget {
  final List<String> days = [
    "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
  ];

  final List<List<String>> meals = [
    ["🥚 Boiled egg", "🥣 Cereal with milk", "🍵 Mixed green salad + Sandwich"],
    ["🍳 Omelette with oats", "🍝 Pasta marinara", "🥗 No food past 6pm"],
    ["🍞 Toast with cheese", "🍗 Grilled chicken and greens", "🥒 Vegetables + rice"],
    ["🥑 Fruit + egg + tea", "🥗 Roasted vegetables", "🍲 Mushroom soup"],
    ["🍌 Banana + milk", "🌮 Whole wheat wrap", "🥦 Steamed broccoli"],
    ["🍎 Apple slices + oatmeal", "🥗 Chicken breast salad", "🍠 Boiled sweet potato"],
    ["🥚 Boiled eggs + toast", "🥗 Grilled fish + greens", "🍵 Clear soup"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/home.jpeg', // Make sure this image exists
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Row(
                    children: [
                      // Name
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jayamal Narampanawa",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      // Profile Picture
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/j.jpg'), // Use your uploaded profile image
                      ),
                    ],
                  ),
                ),
                
                // Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Weight loss meal plan",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Table
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      child: Table(
                        border: TableBorder.all(color: Colors.white),
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        columnWidths: const {
                          0: FixedColumnWidth(100),
                          1: FixedColumnWidth(150),
                          2: FixedColumnWidth(150),
                          3: FixedColumnWidth(150),
                        },
                        children: [
                          // Table header
                          TableRow(
                            decoration: BoxDecoration(color: Colors.grey[800]),
                            children: [
                              tableCell('Day', isHeader: true),
                              tableCell('Breakfast', isHeader: true),
                              tableCell('Lunch', isHeader: true),
                              tableCell('Dinner', isHeader: true),
                            ],
                          ),
                          // Data rows
                          for (int i = 0; i < days.length; i++)
                            TableRow(
                              decoration: BoxDecoration(
                                color: i % 2 == 0 ? Colors.grey[900] : Colors.grey[850],
                              ),
                              children: [
                                tableCell(days[i], isHeader: true),
                                tableCell(meals[i][0]),
                                tableCell(meals[i][1]),
                                tableCell(meals[i][2]),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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

  Widget tableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );
  }
}

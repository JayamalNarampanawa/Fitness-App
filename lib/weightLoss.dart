//IMPORTING PACKJAGES and screens
import 'package:fitness_app/profile.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'homeschedule.dart';
import 'settings.dart';
import 'meal.dart';

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

class WeightLossMealPlanScreen extends StatefulWidget {
  @override
  _WeightLossMealPlanScreenState createState() =>
      _WeightLossMealPlanScreenState();
}

class _WeightLossMealPlanScreenState extends State<WeightLossMealPlanScreen> {
  int _currentIndex = 2;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
//BNB Navgaion
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeWorkoutScreen()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => MealScreen()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
        break;
    }
  }
//days 
  final List<String> days = [
    "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
  ];
//meal plan list
  final List<List<String>> meals = [
    ["🥚 Boiled egg", "🥣 Cereal with milk", "🍵 Mixed green salad + Sandwich"],
    ["🍳 Omelette with oats", "🍝 Pasta marinara", "🥗 No food past 6pm"],
    ["🍞 Toast with cheese", "🍗 Grilled chicken and greens", "🥒 Vegetables + rice"],
    ["🥑 Fruit + egg + tea", "🥗 Roasted vegetables", "🍲 Mushroom soup"],
    ["🍌 Banana + milk", "🌮 Whole wheat wrap", "🥦 Steamed broccoli"],
    ["🍎 Apple slices + oatmeal", "🥗 Chicken breast salad", "🍠 Boiled sweet potato"],
    ["🥚 Boiled eggs + toast", "🥗 Grilled fish + greens", "🍵 Clear soup"],
  ];

  // Navigate to EditProfile screen
  void _navigateToProfile(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen()));
  }
//UI
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
                'assets/home.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          //PROFILE SECTION
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => _navigateToProfile(context),//navigation to profile on name touch
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jayamal Narampanawa",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _navigateToProfile(context),//navigate to profile on profile icon touch
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/j.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),
                //title
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Weight Loss Meal Plan",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Meal Plan Table
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

import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'homeschedule.dart';
import 'settings.dart';
import 'meal.dart';

class WeightGainMealPlanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weight Gain Meal Plan',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: WeightGainMealPlanScreen(),
    );
  }
}

class WeightGainMealPlanScreen extends StatefulWidget {
  @override
  _WeightGainMealPlanScreenState createState() => _WeightGainMealPlanScreenState();
}

class _WeightGainMealPlanScreenState extends State<WeightGainMealPlanScreen> {
  int _currentIndex = 2;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

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

  final List<String> days = [
    "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
  ];

  final List<List<String>> meals = [
    [
      "🍳 3pc brown bread toast + 2 boiled eggs",
      "🍛 1 cup rice + 1/2 cup lentils + chicken + yogurt",
      "🍚 1.5 cup rice + 1.5 cup chicken curry + 1 chopped salad + 1 banana"
    ],
    [
      "�헊 2 eggs scrambled + 2 toast + peanut butter",
      "🦧 1 cup cooked vegetables + 1 cup rice + chicken or fish",
      "🧄 1 potato + 2 boiled eggs + 1 chopped salad"
    ],
    [
      "🍌 Peanut butter + banana smoothie + toast",
      "🧉 1 cup curry + 1.5 cup rice + salad + fruit",
      "🍝 Pasta + veggies + chicken or tuna + yogurt"
    ],
    [
      "🧃 1 cup oats + milk + honey + nuts",
      "🍗 Chicken stir fry + noodles + veggies",
      "🍲 2 cup pumpkin soup + 1 sandwich"
    ],
    [
      "🍞 2 bread slices + 1 egg + peanut butter",
      "🍛 Lentil curry + rice + spinach + egg",
      "🧈 1 grilled meat portion + rice + salad"
    ],
    [
      "�헊 2 egg omelette + toast + avocado",
      "🍝 Whole wheat pasta + grilled vegetables + tuna",
      "🧄 Baked potato + beans + salad"
    ],
    [
      "🍳 Egg + bread + milk",
      "🍗 Grilled chicken + sweet potato + greens",
      "🦧 Salad + lentils + soup + yogurt"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/home.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Updated Profile Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Text(
                              "Jayamal Narampanawa",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            SizedBox(height: 20),
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
                
                        ],
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/j.jpg'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
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
                          1: FixedColumnWidth(180),
                          2: FixedColumnWidth(180),
                          3: FixedColumnWidth(200),
                        },
                        children: [
                          TableRow(
                            decoration: BoxDecoration(color: Colors.grey[800]),
                            children: [
                              tableCell('Day', isHeader: true),
                              tableCell('Breakfast', isHeader: true),
                              tableCell('Lunch', isHeader: true),
                              tableCell('Dinner', isHeader: true),
                            ],
                          ),
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
          fontSize: 13,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: Colors.white,
        ),
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
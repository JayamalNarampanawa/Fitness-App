//importing screens and packages
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'homeschedule.dart';
import 'settings.dart';
import 'meal.dart';

class MaintenanceMealPlanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maintenance Meal Plan',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MaintenanceMealPlanScreen(),
    );
  }
}

class MaintenanceMealPlanScreen extends StatefulWidget {
  @override
  _MaintenanceMealPlanScreenState createState() => _MaintenanceMealPlanScreenState();
}

class _MaintenanceMealPlanScreenState extends State<MaintenanceMealPlanScreen> {
  int _currentIndex = 2;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
//BNB Navigaion
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
//meals
  final List<List<String>> meals = [
    [
      "🍳 Greek yogurt with berries and honey",
      "🥗 Grilled chicken salad with quinoa and vinaigrette",
      "🍚 Steamed vegetables + fish or tofu + brown rice"
    ],
    [
      "🥣 Oatmeal topped with banana and almonds",
      "🍝 Turkey sandwich with whole grain bread + salad",
      "🥦 Stir-fried veggies + grilled paneer or chicken"
    ],
    [
      "🍓 Smoothie with milk, banana, berries, flax seeds",
      "🥙 Lentils salad with greens + bread roll",
      "🥘 Baked chicken or fish + mashed potato + broccoli"
    ],
    [
      "🥛 Chia seed pudding + mixed fruits",
      "🍚 Rice + dal + mixed vegetables",
      "🍔 Grilled burger with avocado + sweet potato fries"
    ],
    [
      "🍞 Whole grain toast + avocado + boiled egg",
      "🥗 Couscous with chickpeas + tomato salad",
      "🍲 Mixed vegetable stew + multigrain bread"
    ],
    [
      "🍌 Banana + milk + boiled egg + toast",
      "🍝 Pasta with lean beef sauce + green beans",
      "🍛 Brown rice + tofu curry + salad"
    ],
    [
      "🍳 Scrambled eggs + mushrooms + spinach",
      "🥗 Grilled shrimp salad + whole wheat bread",
      "🥞 Veggie pancake + soup or salad"
    ],
  ];
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
              opacity: 0.2,
              child: Image.asset(
                'assets/home.jpeg', 
                fit: BoxFit.cover,
              ),
            ),
          ),
          //profile area
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jayamal Narampanawa",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      //profile icon
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/j.jpg'),
                      ),
                    ],
                  ),
                ),
                //title
                SizedBox(height: 30),
                Text(
                  "Maintenance meal plan",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                //table attrbutes
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
      //BNB Attributes
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

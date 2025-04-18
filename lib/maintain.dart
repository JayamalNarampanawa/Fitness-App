import 'package:flutter/material.dart';

void main() => runApp(MaintenanceMealPlanApp());

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

class MaintenanceMealPlanScreen extends StatelessWidget {
  final List<String> days = [
    "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
  ];

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
                'assets/home.jpeg', // Replace with your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Jayamal Narampanawa",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "Maintenance meal plan",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),

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
                          1: FixedColumnWidth(180),
                          2: FixedColumnWidth(180),
                          3: FixedColumnWidth(200),
                        },
                        children: [
                          // Table Header
                          TableRow(
                            decoration: BoxDecoration(color: Colors.grey[800]),
                            children: [
                              tableCell('Day', isHeader: true),
                              tableCell('Breakfast', isHeader: true),
                              tableCell('Lunch', isHeader: true),
                              tableCell('Dinner', isHeader: true),
                            ],
                          ),
                          // Data Rows
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

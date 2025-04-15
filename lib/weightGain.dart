import 'package:flutter/material.dart';

void main() => runApp(WeightGainMealPlanApp());

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

class WeightGainMealPlanScreen extends StatelessWidget {
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
      "🥚 2 eggs scrambled + 2 toast + peanut butter",
      "🥗 1 cup cooked vegetables + 1 cup rice + chicken or fish",
      "🥔 1 potato + 2 boiled eggs + 1 chopped salad"
    ],
    [
      "🍌 Peanut butter + banana smoothie + toast",
      "🥙 1 cup curry + 1.5 cup rice + salad + fruit",
      "🍝 Pasta + veggies + chicken or tuna + yogurt"
    ],
    [
      "🥣 1 cup oats + milk + honey + nuts",
      "🍗 Chicken stir fry + noodles + veggies",
      "🍲 2 cup pumpkin soup + 1 sandwich"
    ],
    [
      "🍞 2 bread slices + 1 egg + peanut butter",
      "🍛 Lentil curry + rice + spinach + egg",
      "🥩 1 grilled meat portion + rice + salad"
    ],
    [
      "🥚 2 egg omelette + toast + avocado",
      "🍝 Whole wheat pasta + grilled vegetables + tuna",
      "🥔 Baked potato + beans + salad"
    ],
    [
      "🍳 Egg + bread + milk",
      "🍗 Grilled chicken + sweet potato + greens",
      "🥗 Salad + lentils + soup + yogurt"
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
                'assets/home.jpeg', // Use your actual background image
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
                        "Weight gain meal plan",
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
                          // Header row
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

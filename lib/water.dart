import 'package:flutter/material.dart';
import 'waterSchedule.dart'; 

void main() {
  runApp(WaterTrackerApp());
}

class WaterTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WaterTrackerPage(),
    );
  }
}

class WaterTrackerPage extends StatefulWidget {
  @override
  _WaterTrackerPageState createState() => _WaterTrackerPageState();
}
//variable declaration
class _WaterTrackerPageState extends State<WaterTrackerPage> {
  int waterIntake = 0;
  final int goal = 2000;

//method to add water
  void _addWater() {
    setState(() {
      waterIntake = (waterIntake + 250).clamp(0, goal);
    });
  }
//UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BG
      backgroundColor: Color(0xFF1A1A1A),
      body: SafeArea(
        child: Stack(
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //name
                      Expanded(
                        child: Text(
                          "Jayamal Narampanawa",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      //profile icon
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/j.jpg'),
                      ),
                    ],
                  ),
                ),
                //widget to graph
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Graph Placeholder",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  //water target
                  child: Column(
                    children: [
                      Icon(Icons.water_drop, color: Colors.blue[300], size: 50),
                      SizedBox(height: 10),
                      Text(
                        "$waterIntake / $goal ml",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        
                        onPressed: _addWater,
                        child: Text(
                          "+250ml",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Need a schedule ?? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WaterSchedule()),
                        );
                      },
                      child: Text(
                        "click here",
                        style: TextStyle(color: Colors.lightBlueAccent),
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(StepCounterApp());
}

class StepCounterApp extends StatelessWidget {
  const StepCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StepCounterScreen(),
    );
  }
}

class StepCounterScreen extends StatefulWidget {
  const StepCounterScreen({super.key});

  @override
  _StepCounterScreenState createState() => _StepCounterScreenState();
}

class _StepCounterScreenState extends State<StepCounterScreen> {
  int _steps = 0;
  final int _stepGoal = 10000;
  double _distance = 0.0;
  final List<int> _weeklySteps = [1000, 2000, 1500, 3000, 2500, 4000, 5000];

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    if (await Permission.activityRecognition.request().isGranted) {
      _initPedometer();
    }
  }

  void _initPedometer() {
    Pedometer.stepCountStream.listen(
      (StepCount event) {
        setState(() {
          _steps = event.steps;
          _distance = _steps * 0.0007;
        });
      },
      onError: (error) {
        print("Pedometer Error: $error");
      },
    );
  }

  double getProgress() {
    return (_steps / _stepGoal).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/home.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.6)),
          Column(
            children: [
              SizedBox(height: 50),
              _buildStepGraph(),
              SizedBox(height: 20),
              _buildStepCounter(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepGraph() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        padding: EdgeInsets.all(30),
        margin: EdgeInsets.fromLTRB(10, 130, 10, 20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Steps", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text(_steps.toString(), style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: _weeklySteps.asMap().entries.map((entry) {
                    return BarChartGroupData(
                      x: entry.key,
                      barRods: [
                        BarChartRodData(
                          toY: entry.value.toDouble(),
                          color: entry.value > 3000 ? Colors.green : Colors.yellow,
                          width: 8,
                          borderRadius: BorderRadius.circular(5),
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepCounter() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$_steps", style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                Text("steps", style: TextStyle(color: Colors.white70, fontSize: 20)),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 10,
              width: 200,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: getProgress(),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("${_distance.toStringAsFixed(2)} km", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
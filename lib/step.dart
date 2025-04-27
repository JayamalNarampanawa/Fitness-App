import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const StepCounterApp());
}

class StepCounterApp extends StatelessWidget {
  const StepCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StepCounterScreen(),
    );
  }
}

class StepCounterScreen extends StatefulWidget {
  const StepCounterScreen({super.key});

  @override
  State<StepCounterScreen> createState() => _StepCounterScreenState();
}

class _StepCounterScreenState extends State<StepCounterScreen> {
  int _todaySteps = 0;
  int _startSteps = 0;
  int _currentSteps = 0;
  final int _stepGoal = 3000;
  double _distance = 0.0;
  late Stream<StepCount> _stepCountStream;
  Timer? _midnightTimer;

  final List<int> _weeklySteps = [1000, 2000, 1500, 3000, 2500, 4000, 5000];

  @override
  void initState() {
    super.initState();
    _initPlatformState();
    _scheduleMidnightReset();
  }

  @override
  void dispose() {
    _midnightTimer?.cancel();
    super.dispose();
  }

  Future<void> _initPlatformState() async {
    PermissionStatus permission = await Permission.activityRecognition.status;
    if (!permission.isGranted) {
      permission = await Permission.activityRecognition.request();
    }

    if (permission.isGranted) {
      _startListening();
    } else {
      print('Permission denied');
    }
  }

  void _startListening() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(
      (StepCount event) {
        if (_startSteps == 0) {
          _startSteps = event.steps; // First time opening app today
        }
        setState(() {
          _currentSteps = event.steps;
          _todaySteps = _currentSteps - _startSteps;
          _distance = _todaySteps * 0.0007;
        });
      },
      onError: (error) {
        print('Pedometer Error: $error');
      },
      cancelOnError: true,
    );
  }

  void _scheduleMidnightReset() {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final durationUntilMidnight = tomorrow.difference(now);

    _midnightTimer = Timer(durationUntilMidnight, () {
      _resetStepsAtMidnight();
    });
  }

  void _resetStepsAtMidnight() {
    setState(() {
      _startSteps = _currentSteps; // Set new base for next day
      _todaySteps = 0;
      _distance = 0.0;
    });
    _scheduleMidnightReset(); // Reschedule for next midnight
  }

  double getProgress() {
    return (_todaySteps / _stepGoal).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundImage(),
          Container(color: Colors.black.withOpacity(0.6)),
          Column(
            children: [
              const SizedBox(height: 50),
              _buildStepGraph(),
              const SizedBox(height: 20),
              _buildStepCounter(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _backgroundImage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/home.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildStepGraph() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.fromLTRB(10, 130, 10, 20),
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
                const Text("Weekly Steps",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Text("$_todaySteps",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
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
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$_todaySteps",
                  style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                const Text(
                  "steps",
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 10,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade600),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: getProgress(),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${_distance.toStringAsFixed(2)} km",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SleepScreen extends StatefulWidget {
  @override
  _SleepScreenState createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  bool isSleeping = false;
  DateTime? sleepStartTime;
  Duration totalSleep = Duration.zero;

  void _toggleSleepTracking() {
    setState(() {
      if (!isSleeping) {
        sleepStartTime = DateTime.now();
      } else {
        if (sleepStartTime != null) {
          totalSleep += DateTime.now().difference(sleepStartTime!);
        }
        sleepStartTime = null;
      }
      isSleeping = !isSleeping;
    });
  }

  String _formatDuration(Duration duration) {
    return "${duration.inHours}h ${duration.inMinutes.remainder(60)}m";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sleep Tracker",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Icon(Icons.nightlight_round, size: 100, color: Colors.deepPurpleAccent),
            const SizedBox(height: 20),
            Text(
              isSleeping ? "Tracking..." : "Not Tracking",
              style: TextStyle(
                color: isSleeping ? Colors.greenAccent : Colors.grey,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Total Sleep: ${_formatDuration(totalSleep)}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: _toggleSleepTracking,
              style: ElevatedButton.styleFrom(
                backgroundColor: isSleeping ? Colors.redAccent : Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              icon: Icon(isSleeping ? Icons.pause : Icons.play_arrow),
              label: Text(isSleeping ? "Stop Tracking" : "Start Sleep"),
            ),
            const SizedBox(height: 50),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Sleep History",
                style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.bedtime, color: Colors.white),
                    title: Text(
                      "Night ${index + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text("7h 45m", style: TextStyle(color: Colors.white60)),
                    trailing: const Text("22:30 - 06:15", style: TextStyle(color: Colors.white54)),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

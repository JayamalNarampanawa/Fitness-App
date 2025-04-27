//importing
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Crossoverlungues extends StatefulWidget {
  @override
  _Crossoverlungues createState() => _Crossoverlungues();
}
//variables
class _Crossoverlungues extends State<Crossoverlungues> {
  late VideoPlayerController _controller;
  Timer? _timer;
  int _seconds = 30;
  bool _isRunning = false;
  bool _isPaused = false;
//video
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/CrossOverLunge.mp4')//video
      ..initialize().then((_) => setState(() {}));
  }
//timer controller with vide
  void startTimer() {
    if (_isRunning || _seconds == 0) return;

    setState(() {
      _isRunning = true;
      _isPaused = false;
    });

    _controller.play();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        timer.cancel();
        _controller.pause();
        setState(() {
          _isRunning = false;
        });
      }
    });
  }

  void pauseTimer() {
    if (_isRunning) {
      _timer?.cancel();
      _controller.pause();
      setState(() {
        _isRunning = false;
        _isPaused = true;
      });
    } else if (_isPaused) {
      startTimer();
    }
  }

  void resetTimer() {
    _timer?.cancel();
    _controller.pause();
    _controller.seekTo(Duration.zero);
    setState(() {
      _seconds = 30;
      _isRunning = false;
      _isPaused = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }
//UI decorating
  @override
  Widget build(BuildContext context) {
    double progress = (30 - _seconds) / 30;
//bg
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        //video attributes
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_controller.value.isInitialized)
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              SizedBox(height: 20),
              //progress bar
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.white24,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                minHeight: 10,
              ),
              //seconds
              SizedBox(height: 20),
              Text(
                '$_seconds s',
                style: TextStyle(fontSize: 36, color: Colors.white),
              ),
              SizedBox(height: 20),
              //user controlls
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: startTimer,
                    child: Text('Start'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: pauseTimer,
                    child: Text(_isPaused ? 'Resume' : 'Pause'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: resetTimer,
                    child: Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

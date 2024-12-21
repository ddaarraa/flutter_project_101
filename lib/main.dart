import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer _timer;
  int _remainingTime = 60; // Countdown from 60 seconds
  bool _isPaused = false; // Track if the timer is paused
  final TextEditingController _controller = TextEditingController();
  bool _isExploded = false; // Track if the bomb has exploded

  @override
  void initState() {
    super.initState();
    // Initialize the timer but do not start it yet
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isPaused) {
        setState(() {
          if (_remainingTime > 0) {
            _remainingTime--;
          } else {
            _isExploded = true; // Set exploded state to true
            _timer.cancel(); // Stop the timer when it reaches zero
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startCountdown() {
    setState(() {
      // Convert input minutes to seconds
      _remainingTime = (int.tryParse(_controller.text) ?? 1) * 60; // Default to 1 minute if input is invalid
      _isPaused = false; // Ensure timer is not paused
      _isExploded = false; // Reset exploded state
    });
  }

  void _pauseCountdown() {
    setState(() {
      _isPaused = true; // Pause the countdown
    });
  }

  void _resetCountdown() {
    setState(() {
      _remainingTime = 60; // Reset to 1 minute (60 seconds)
      _isPaused = false; // Ensure timer is not paused
      _controller.clear(); // Clear the input field
      _isExploded = false; // Reset exploded state
    });
  }

  String _formattedTime() {
    final minutes = _remainingTime ~/ 60;
    final seconds = _remainingTime % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CPSU Project', style: TextStyle(color: Colors.green)),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isExploded) // Show the bomb image if exploded
              Image.asset('assets/exploded_bomb.jpeg', width: 100, height: 100),
            if (!_isExploded) // Show the countdown timer if not exploded
              Text(
                _formattedTime(),
                style: const TextStyle(fontSize: 48, color: Colors.red), // Text color set to red
              ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter time in minutes',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _startCountdown(); // Start the countdown
              },
              child: const Text('Start Countdown'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pauseCountdown,
              child: const Text('Pause'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetCountdown,
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}



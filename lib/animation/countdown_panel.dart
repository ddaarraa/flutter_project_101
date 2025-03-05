import 'dart:async';
import 'package:flutter/material.dart';

class CountdownPanel extends StatefulWidget {
  final int seconds ; 
  final int currentLightIndex;
  final Function(int, int) onLightChange;
  
  const CountdownPanel({super.key, required this.currentLightIndex, required this.seconds, required this.onLightChange});

  @override
  _CountdownPanelState createState() => _CountdownPanelState();
}

class _CountdownPanelState extends State<CountdownPanel> {
  late int remainingSeconds;
  Timer? timer;
  late int currentLightIndex ;

  @override
  void initState() {
    super.initState();
    currentLightIndex = widget.currentLightIndex;
    remainingSeconds = widget.seconds;
    startCountdown();
    
  }

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 1) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        currentLightIndex = (currentLightIndex + 1) % 3;
        if (!mounted) return;
        if (currentLightIndex == 0) {
          setState(() {
            remainingSeconds = 15;
          });
          widget.onLightChange(currentLightIndex, remainingSeconds );  
        }else if (currentLightIndex == 1) {

          setState(() {
            remainingSeconds = 5;
          });
          widget.onLightChange(currentLightIndex, remainingSeconds ); 
        }else if (currentLightIndex == 2) {
          setState(() {
            remainingSeconds = 10;
          });
          widget.onLightChange(currentLightIndex, remainingSeconds ); 
        }
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel(); 
    super.dispose();
  }

  String formatTime(int seconds) {
    return seconds.toString().padLeft(2, '0'); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 60,
      // decoration: BoxDecoration(
      //   color: Colors.black,
      //   borderRadius: BorderRadius.circular(12),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withOpacity(0.3),
      //       blurRadius: 5,
      //       spreadRadius: 2,
      //     ),
      //   ],
      // ),
      child: Center(
        child: Text(
          formatTime(remainingSeconds),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 36, // Bigger font
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
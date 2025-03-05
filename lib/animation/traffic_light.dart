import 'package:flutter/material.dart';
import 'package:flutter_project_101/animation/countdown_panel.dart';
import 'package:flutter_project_101/animation/light.dart';

class Trafficlight extends StatefulWidget {
  // final VoidCallback toggleTheme;
  // final bool isDarkMode;
  const Trafficlight(
      {super.key});

  @override
  State<Trafficlight> createState() => _TrafficlightState();
}

class _TrafficlightState extends State<Trafficlight> {
  int currentLightIndex = 0;
  int seconds = 15;
  // void _toggleOpacity() {
  //   setState(() {
  //     _currentLightIndex = (_currentLightIndex + 1) % 3;
  //   });
  // }
  void updateLightIndex(int index, int seconds) {
    setState(() {
      currentLightIndex = index;
      this.seconds = seconds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Traffic Light Animation"),
        backgroundColor: Colors.black12,
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
        //     onPressed: widget.toggleTheme,
        //   )
        // ],
      ),
      body: Center(

        child: Container(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CountdownPanel(onLightChange: updateLightIndex, currentLightIndex: currentLightIndex,),
              const SizedBox(height: 30),
              TrafficLightwidget(
                color: Colors.green,
                opacity: currentLightIndex == 0 ? 1.0 : 0.1,
                child: currentLightIndex == 0 ? CountdownPanel(onLightChange: updateLightIndex, currentLightIndex: currentLightIndex, seconds: seconds,) : const Text("")
              ),
              const SizedBox(
                height: 20,
              ),
              TrafficLightwidget(
                color: Colors.yellow,
                opacity: currentLightIndex == 1 ? 1.0 : 0.1,
                child: currentLightIndex == 1 ? CountdownPanel(onLightChange: updateLightIndex, currentLightIndex: currentLightIndex, seconds: seconds,) : const Text("")
              ),
              const SizedBox(
                height: 20,
              ),
              TrafficLightwidget(
                color: Colors.red,
                opacity: currentLightIndex == 2 ? 1.0 : 0.1,
                child: currentLightIndex == 2 ? CountdownPanel(onLightChange: updateLightIndex, currentLightIndex: currentLightIndex, seconds: seconds,) : const Text("")
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

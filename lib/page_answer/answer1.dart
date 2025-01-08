import 'package:flutter/material.dart';

class GridfulWidget extends StatelessWidget {
  const GridfulWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
        appBar: AppBar(
            title: const Text("grid layout",
                style: TextStyle(
                    color: Colors.white, fontSize: 28, letterSpacing: 2)),
            backgroundColor: Colors.redAccent,
            centerTitle: true),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body:
      Column(
        
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 20, width: 20),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              const SizedBox(height: 20, width: 20),
              Container(
                height: 100,
                width: 100,
                color: const Color.fromARGB(255, 62, 174, 88),
              ),
              const SizedBox(height: 20, width: 20),
              Container(
                height: 100,
                width: 100,
                color: const Color.fromARGB(255, 31, 80, 111),
              )
            ],
          ),
          const SizedBox(height: 20, width: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                color: const Color.fromARGB(255, 198, 129, 68),
              ),
              const SizedBox(height: 20, width: 20),
              Container(
                height: 100,
                width: 100,
                color: const Color.fromARGB(255, 142, 55, 160),
              ),
              const SizedBox(height: 20, width: 20),
              Container(
                height: 100,
                width: 100,
                color: const Color.fromARGB(255, 180, 178, 59),
              )
            ],
          ),
        ],
      )
    );
  }
}
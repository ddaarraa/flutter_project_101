import 'package:flutter/material.dart';
import 'answer1.dart';
import 'answer2.dart';
import 'answer3.dart';
import 'answer4.dart';

class AnswerPortal extends StatelessWidget {
  const AnswerPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
            title: const Text("My Answer",
                style: TextStyle(
                    color: Colors.white, fontSize: 28, letterSpacing: 2)),
            backgroundColor: Colors.redAccent,
            centerTitle: true),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255)
        ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GridfulWidget()),
                );
              },
              child: const Text('Answer1'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SocialMediaWidget()),
                );
              },
              child: const Text('Answer2'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductLayoutWidget()),
                );
              },
              child: const Text('answer3'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePageWidget()),
                );
              },
              child: const Text('Answer4'),
            ),
          ],
        ),
      ),
    );
  }
}
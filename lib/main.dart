// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_project_101/page_answer/answer_portal.dart';
// import 'package:flutter_project_101/week4/aqi.dart';
// import 'package:flutter_project_101/firebase.dart';
// import 'card_component/profileCard.dart';
import 'package:flutter_project_101/animation/traffic_light.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //         apiKey: dotenv.env['API_KEY']!,
  //         authDomain: dotenv.env['AUTH_DOMAIN']!,
  //         projectId: dotenv.env['PROJECT_ID']!,
  //         storageBucket: dotenv.env['STORAGE_BUCKET']!,
  //         messagingSenderId: dotenv.env['MESSAGING_SENDER_ID']!,
  //         appId: dotenv.env['APP_ID']!,
  //         measurementId: dotenv.env['MEASUREMENT_ID']
  //     ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Trafficlight(),
      theme: ThemeData.dark(),
    );
  }
}
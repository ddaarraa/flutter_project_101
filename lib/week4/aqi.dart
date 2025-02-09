import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var aqiData = AqiData();
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchAqiData();
  }

  Future<void> fetchAqiData() async {
    setState(() => isLoading = true);
    await aqiData.fetchData();
    setState(() {isLoading = false ;}); 
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
            title: const Text("Air Quality Index(Aqi)",
                style: TextStyle(
                    color: Colors.white, fontSize: 28, letterSpacing: 2)),
            backgroundColor: Colors.redAccent,
            centerTitle: true),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255)
        ,
      body: Column(
        children: [
  
          SizedBox(
            width: double.infinity,
            child: Text(aqiData.cityName, textAlign: TextAlign.center, style: const TextStyle(fontSize: 50))
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.fromLTRB(20,0,20,0),
            decoration: BoxDecoration(
                color: aqiData.getcolor(),
                borderRadius: BorderRadius.circular(20), 
              ),
            width: double.infinity,
            height: 200, 
            child: Center(
                child: Text(
                  aqiData.aqi.toString(),
                  style: const TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ), 
          ),
          const SizedBox(height: 10),
          Text(
            aqiData.getHealth(),
            style: TextStyle(fontSize: 28, color: aqiData.getcolor(), fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "Temperature : ${aqiData.temperature}",
            style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: () => {
            fetchAqiData(),
            
          }
          , child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : const Text("Refresh"),
          ),
        ]
      )
    );
  }
}

class AqiData {
  String cityName = "" ;
  double aqi = 11 ;
  double temperature = 32.1 ;

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse("https://api.waqi.info/feed/newyork/?token=47cc05d247bb64ac9374cb193a71f1e406a36848"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var aqiData = data['data'];

      cityName = aqiData['city']['name'];
      aqi = aqiData['aqi'];
      temperature = aqiData['iaqi']['t']['v'].toDouble();

    } else {
      throw Exception("Failed to fetch data");
    }
  }

  String getHealth(){
    if (aqi <= 50) {
      return "Good";
    } else if (aqi <= 100) {
      return "Moderate";
    } else if (aqi <= 150) {
      return "Unhealthy for sensitive groups";
    } else if (aqi <= 200) {
      return "Unhealthy";
    } else if (aqi <= 300) {
      return "Very Unhealthy";
    } else {
      return "Hazardous";
    }
  }

  Color getcolor() {
    if (aqi <= 50) {
      return Colors.green;
    } else if (aqi <= 100) {
      return Colors.yellow;
    } else if (aqi <= 150) {
      return Colors.orange;
    } else if (aqi <= 200) {
      return Colors.red;
    } else if (aqi <= 300) {
      return Colors.purple;
    } else {
      return Colors.black;
    }
  }
}
import 'package:flutter/material.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
        appBar: AppBar(
            title: const Text("Social Media Post",
                style: TextStyle(
                    color: Colors.white, fontSize: 28, letterSpacing: 2)),
            backgroundColor: Colors.redAccent,
            centerTitle: true),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body:
      Container(
        margin: const EdgeInsets.all(20),
        child: Column(
        
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: 
                  Container(height:50, width:50, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.blue))
              ),
              Expanded(
                flex: 4,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Username',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(height: 1), // Add some space between title and subtitle
                    Text(
                      '5 minutes ago',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20, width: 20),
              
            ],
          ),
          const SizedBox(height: 20, width: 20),
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey,
          ),
          const SizedBox(height: 20, width: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 2, child:ElevatedButton(onPressed: () { 
                    }, 
                    child: Container(
                      // height: 30,
                      // width: 40,
                      child: const Center(child: 
                      Text("Like",
                        style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),)) ,
              )),),
              
              const SizedBox(width: 10),
              Expanded(flex: 3, child:ElevatedButton(onPressed: () { 
                    }, 
                    child: Container(
                      
                      child: const Center(child: 
                      Text("comment",
                        style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),)) ,
              )),),
              const SizedBox( width: 10),
              Expanded(flex: 2, 
                child:ElevatedButton(onPressed: () { 
                    }, 
                    child: Container(
                      // height: 30,
                      // width: 40,
                      child: const Center(child: 
                      Text("share",
                        style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),)) ,
              )),)]
          ),
        ],
      ),
      )
      
    );
  }
}
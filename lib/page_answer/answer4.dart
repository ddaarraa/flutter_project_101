import 'package:flutter/material.dart';

class ProfilePageWidget extends StatelessWidget {
  const ProfilePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
        appBar: AppBar(
            title: const Text("ProfilePage",
                style: TextStyle(
                    color: Colors.white, fontSize: 28, letterSpacing: 2)),
            backgroundColor: Colors.redAccent,
            centerTitle: true),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(

          children: [
            
            Container( 
              height: 200,
              width: double.infinity,
              color: Colors.blue,
              child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [
                  
                    
                      Container(height:80, width:80, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white)),
                      SizedBox(height: 20,)
                      ,const Text(
                          'Daaaraaaa',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                  ),
                  const SizedBox(height: 20, width: 20),
                  Container( 
                    margin: const EdgeInsets.only(left: 10),
                    child: const Column(
                      children: [
                        Row(children: [
                          Icon(Icons.email),
                          SizedBox(width: 10,),
                          Text("watchhme9@gmail.com")
                        ],),
                        SizedBox(height: 10,),
                        Row(children: [
                          Icon(Icons.phone),
                          SizedBox(width: 10,),
                          Text("1234567890")
                        ],),
                        SizedBox(height: 10,),
                        Row(children: [
                          Icon(Icons.location_pin),
                          SizedBox(width: 10,),
                          Text("Phnom Penh")
                        ],)
                      ],
                    )
                  )
                  
                ],
                
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              width: 300,
              child: 
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child:ElevatedButton(onPressed: () {}, 
                        child: const Center(child: 
                        Text("Edit Profile",
                          style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )) ,
                )),),
                
                const SizedBox(width: 10),
                Expanded(flex: 1, child:ElevatedButton(onPressed: () {}, 
                        child: const Center(child: 
                        Text("Logout",
                          style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),)) ,
                ),),
                ]
              )
            )
            
          ]),
        
      );
    
  }
}
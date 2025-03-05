import 'package:flutter/material.dart';

class Profilecard extends StatelessWidget {
  final String name;
  final String position;
  final String email;
  final String phoneNumber;
  final String imageurl;

  const Profilecard(
      {super.key,
      required this.name,
      required this.position,
      required this.email,
      required this.phoneNumber,
      required this.imageurl});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: 
        AppBar(
            title: const Text("CustomWidget",
                style: TextStyle(
                    color: Colors.white, fontSize: 28, letterSpacing: 2)),
            backgroundColor: Colors.redAccent,
            centerTitle: true),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Center(
        child: Container(
          height: 500,
          width: double.infinity,
          color: Colors.blue,
          child :
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(imageurl),
                  radius: 40,
                ),
                const SizedBox(height: 10),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  )
                ),
                const SizedBox(height: 10),
                Text(position,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 84, 83, 83)
                  )
                ),
                const SizedBox(height: 10,),
                Text(
                  email,
                  style : const TextStyle(
                    fontSize: 15,
                    color: Colors.white
                  )
                ),
                const SizedBox(height: 10,),
                Text(
                  phoneNumber,
                  style : const TextStyle(
                    fontSize: 15,
                    color: Colors.white
                  )
                )

              ],
          )
        ),
      )
    ); 
  }
}


import 'package:flutter/material.dart';

class ProductLayoutWidget extends StatelessWidget {
  const ProductLayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
        appBar: AppBar(
            title: const Text("Product Layout",
                style: TextStyle(
                    color: Colors.white, fontSize: 28, letterSpacing: 2)),
            backgroundColor: Colors.redAccent,
            centerTitle: true),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body:
      Container(
        

        child: Column(
        
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Container(height: 50, width: double.infinity, color: Colors.grey,
              child :
                const Row(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Category : Electronic", style: TextStyle(fontSize: 21))],
                ),
            ),
            
            const SizedBox(height: 20, width: 20),

          Container(margin: const EdgeInsets.all(20), child: 
            Column(
              children: 
                [
                  Row(
                    children: [
                      ProductWidget("Laptop","https://media.istockphoto.com/id/479520746/photo/laptop-with-blank-screen-on-white.jpg?s=612x612&w=0&k=20&c=V5dj0ayS8He0BP4x15WR5t5NKYzWTKv7VdWvD2SAVAM="),
                      const SizedBox(width: 20,),
                      ProductWidget("Pencil","https://m.media-amazon.com/images/I/51Uo7kfSt0L.jpg"),

                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      ProductWidget("Big Bike","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcgHCYHOBDGXetlTdNO9juPD0RVBjb0Ld_Rw&s"),
                      const SizedBox(width: 20,),
                      ProductWidget("Laptop","https://media.istockphoto.com/id/479520746/photo/laptop-with-blank-screen-on-white.jpg?s=612x612&w=0&k=20&c=V5dj0ayS8He0BP4x15WR5t5NKYzWTKv7VdWvD2SAVAM="),

                    ],
                  ),
                ]
                
            )
          )
          ,
          
        ],
      ),
      )
      
    );
  }
}

// ignore: must_be_immutable
class ProductWidget extends StatelessWidget {
  String imageLink = "";
  String productName = "";
  ProductWidget( this.productName, this.imageLink, {super.key} ) ;
  
  @override
  Widget build(BuildContext context) {
    return 
      Expanded(flex:1, 
      child:
        Container( height: 250, width: 200, decoration: BoxDecoration( color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(
              color: Colors.black.withOpacity(0.25), // Shadow color with opacity
              offset: const Offset(1, 1), // Offset in x and y
              blurRadius: 3, // Softness of the shadow
              spreadRadius: 1, // Spread of the shadow
            ),]) ,child: Column(
            children: [
              // Container(height: 200, width: 200, color: Colors.grey),
              Expanded( // To ensure the image takes available space
                  child: Image.network(
                    scale: 0.5,
                    imageLink,
                    fit: BoxFit.cover,
                    width: double.infinity, // Make the image fill the width of the container
                  ),
                ),
              Text(productName)
                
            ],
          ),
        ),
      );
  }
}
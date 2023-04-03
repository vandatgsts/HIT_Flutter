import 'package:buoi4/dummy_data.dart';
import 'package:flutter/material.dart';

class CompomentListView extends StatelessWidget {
  String imageUrl;
  int textTimer;
  String title;
 CompomentListView({super.key,  required this.imageUrl,required this.textTimer,required this.title});



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Container(
          padding: EdgeInsets.only(bottom: 10),
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            // implement shadow effect
            boxShadow: const [
            BoxShadow(
                color: Colors.black54, // shadow color
                blurRadius: 5, // shadow radius// shadow offset
                spreadRadius: 0.1, // The amount the box should be inflated prior to applying the blur
                blurStyle: BlurStyle.normal // set blur style
            ),
          ]),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  
                  ClipRRect(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                      child: Image.network(imageUrl,)),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Color(0x891C1A1A)
                    ),
                    child: Text(title,
                      style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.timer,color: Colors.black54,),
                      Text(' $textTimer min',style: TextStyle(color: Colors.black54,),),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.card_travel_rounded,color: Colors.black54,),
                      Text(' Simple',style: TextStyle(color: Colors.black54,)),
                    ],
                  ),
                  Row(
                    children:const [
                          Icon(Icons.attach_money,color: Colors.black54),
                          Text(' Affordable',style: TextStyle(color: Colors.black54,)),
                    ],
                  )
                ],)
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class Compoment extends StatelessWidget {
  Color color;
  String title;

  Compoment(this.color, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      height:100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Text(title,style: const TextStyle(color: Colors.black),),
    );
  }
}

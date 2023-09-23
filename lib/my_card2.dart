import 'package:flutter/material.dart';


class MyCard2 extends StatelessWidget {
  final  String title;
  final IconData icon;
  final String number;
  MyCard2(
    {
      super.key,
      required this.title, required this.icon,required this.number});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      
     
      
        child: Column(children: [
          Icon(icon,size: 40,),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          
          
          Text(number,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),)
        ]),
    
    );
  }
}
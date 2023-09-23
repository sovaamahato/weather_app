import 'package:flutter/material.dart';


class MyCard1 extends StatelessWidget {
  String temp;
  String time;
  final IconData icon;
  MyCard1({required this.temp,required this.time,required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  width: 100,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13)),
                    elevation: 6,
                    child:  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(children: [
                        Text(
                          
                          time,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20),
                        ),
                       const SizedBox(
                          height: 10,
                        ),
                        Icon(icon),
                       const  SizedBox(
                          height: 10,
                        ),
                        Text(temp)
                      ]),
                    ),
                  ),
                );
  }
}
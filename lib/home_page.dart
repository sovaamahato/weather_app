import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practice/main.dart';
import 'package:practice/my_card1.dart';
import 'package:practice/my_card2.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Weather App",
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //first box-------------------
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  //this back drop filter used to merge the card with background and gives a blur effect
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(children: [
                      Text(
                        "300.67 F",
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.cloud,
                        size: 64,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Rain",
                        style: TextStyle(fontSize: 20),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ),

          //text -weather forcast-------------------------
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Weather forecast",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
const SizedBox(height: 10,),
          //listview horizontal----------------------
         const  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MyCard1(),
                MyCard1(),
                MyCard1(),
                MyCard1(),
                MyCard1(),

              ],
            ),
          ),
          //text-----------------------

          const SizedBox(
            height: 20,
          ),
          const Text(
            "Additional Information",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          //icons with text wala row--------------------------
       
           const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyCard2(title: "Humidity", icon: Icons.water_drop,number: "91",),
                MyCard2(title: "Speed Air", icon: Icons.air,number: "1000",),
                MyCard2(title: "Pressure", icon: Icons.beach_access,number: "31.10",),
                
               

              ],
            ),
         
        ]),
      ),
    );
  }
}

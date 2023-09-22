import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        
          title: const Text(

        "Weather App",
        
      ),
      actions:const  [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.refresh),
        ),
      ],),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

        //first box-------------------
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
          color: Colors.grey[700]
          ),
          child: const Column(children: [
            Text("300.67 F",style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add,size: 20,),
                ),
                Icon(Icons.cloud,size: 36,),
              ],
            ),
            
            Text("Rain"),

          ]),
        ),

        //text -weather forcast-------------------------

        //listview horizontal----------------------
        //text-----------------------
        //icons with text wala row--------------------------
      ]),
    );
  }
}

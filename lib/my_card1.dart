import 'package:flutter/material.dart';


class MyCard1 extends StatelessWidget {
  const MyCard1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  width: 100,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13)),
                    elevation: 6,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(children: [
                        Text(
                          "03:00",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(Icons.cloud),
                        SizedBox(
                          height: 10,
                        ),
                        Text("301.17")
                      ]),
                    ),
                  ),
                );
  }
}
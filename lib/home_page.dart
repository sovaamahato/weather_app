import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice/api_key.dart';
import 'package:practice/main.dart';
import 'package:practice/my_card1.dart';
import 'package:practice/my_card2.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Map<String,dynamic>>weather;
  Future <Map<String,dynamic>> getCurrentWeather() async {
    try {
      String cityName = "London";
      final res = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName,&APPID=$openApiKey"));
      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw "An unexpected error occured";
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weather=getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "London weather",
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  weather=getCurrentWeather();
                });
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

//fetching data using api-------------------------------------------
          final data = snapshot.data!;

          final currentWeatherData = data['list'][0];
          final currentTemp = currentWeatherData['main']['temp'];

          final currentSky = currentWeatherData['weather'][0]['main'];
          final currentPressure = currentWeatherData['main']['pressure'];
          final currentWindSpeed = currentWeatherData['wind']['speed'];
          final currentHumidity = currentWeatherData['main']['humidity'];

          //--------------------------------------------------------------------------------
          return Padding(
            padding: EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(children: [
                          Text(
                            (currentTemp - 273.15).toStringAsFixed(2) + "°C",
                            style: const TextStyle(
                                fontSize: 34, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Icon(
                            currentSky == 'Clouds' || currentSky == "Rain"
                                ? Icons.cloud
                                : Icons.sunny,
                            size: 64,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            currentSky,
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
                "Hourly Forecast",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              //listview horizontal----------------------

              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    final time =
                        DateTime.parse(data['list'][index + 1]['dt_txt']);
                    return MyCard1(
                      time: DateFormat.j().format(time),
                      icon: data['list'][index + 1]['weather'][0]['main'] ==
                                  'Clouds' ||
                              data['list'][index + 1]['weather'][0]['main'] ==
                                  'Clouds'
                          ? Icons.cloud
                          : Icons.sunny,
                      temp:((data['list'][index + 1]['main']['temp'])-273.15).toStringAsFixed(2)+"°C",
                    );
                  }),
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

              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyCard2(
                    title: "Humidity",
                    icon: Icons.water_drop,
                    number: currentHumidity.toString(),
                  ),
                  MyCard2(
                    title: "Air Speed",
                    icon: Icons.air,
                    number: currentWindSpeed.toString(),
                  ),
                  MyCard2(
                    title: "Pressure",
                    icon: Icons.beach_access,
                    number: currentPressure.toString(),
                  ),
                ],
              ),
            ]),
          );
        },
      ),
    );
  }
}

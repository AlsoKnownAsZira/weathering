import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weathering/models/weatherModel.dart';

class openWeather extends StatelessWidget {
  final weatherModel weather;
  final String city;
  final int index;
  openWeather({required this.weather, required this.city, required this.index});

  List<String> cityPic = [
    'https://tinyurl.com/bdzb9p8h',
    'https://tinyurl.com/naj7u5py',
    'https://tinyurl.com/6wur8c5w',
    'https://tinyurl.com/ycyxw2xa',
    'https://tinyurl.com/4bs7kez3',
    'https://tinyurl.com/2p85zjea',
    'https://tinyurl.com/ycxxuy6c',
    'https://tinyurl.com/54zt96ec',
    'https://tinyurl.com/yc7dhzbc',
    'https://tinyurl.com/278bjtfe',
  ];
  @override
  Widget build(BuildContext context) {
    DateTime localTime = DateTime.now().add(Duration(
        seconds: weather.time - DateTime.now().timeZoneOffset.inSeconds));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 137, 207, 240),
      ),
      body: Column(
        children: [
          Stack(alignment: Alignment.center, children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(cityPic[index]), fit: BoxFit.cover)),
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Color.fromARGB(99, 0, 0, 0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          city,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'http://openweathermap.org/img/w/${weather.icon}.png'))),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          weather.description,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25),
                        ),
                        Text(
                          "${weather.temp.toStringAsFixed(1)}°C",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ]),
           Padding(
            padding: const EdgeInsets.symmetric( vertical: 20,horizontal: 10),
            child: Row(
              children: [
                Text("🌡️  Feels Like:              ${weather.feelsLike.toStringAsFixed(1)}°C",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric( vertical: 0,horizontal: 10),
            child: Row(
              children: [
                Text("📈  Highest Temp:       ${weather.high.toStringAsFixed(1)}°C",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric( vertical: 20,horizontal: 10),
            child: Row(
              children: [
                Text("📉  Lowest Temp:        ${weather.low.toStringAsFixed(1)}°C",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric( vertical: 0,horizontal: 10),
            child: Row(
              children: [
                Text("💧  Humidity:                ${weather.humidity.toStringAsFixed(1)}%",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric( vertical: 20,horizontal: 10),
            child: Row(
              children: [
                Text("🍃  Wind Speed:          ${weather.windSpeed.toStringAsFixed(1)}meter/sec",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric( vertical: 0,horizontal: 10),
            child: Row(
              children: [
                Text("⏰  Local Timezone:   ${DateFormat("HH:mm").format(localTime)}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}

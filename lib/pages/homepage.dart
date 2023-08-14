import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weathering/models/weatherModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<weatherModel> weatherList = [];
  List<String> cityList = [
    'Jakarta',
    'Seoul',
    'Tokyo',
    'Mecca',
    'Berlin',
    'London',
    'Paris',
    'Moscow',
    'New York',
    'Canberra'
  ];
  @override
  void initState() {
    super.initState();
    loadWeatherData();
  }

  Future<void> loadWeatherData() async {
    for (String city in cityList) {
      weatherModel weather = await getCurrentWeather(city);
      setState(() {
        weatherList.add(weather);
      });
    }
  }

  Future<weatherModel> getCurrentWeather(String city) async {
    String apiKey = "c801a80b0ab520b3260db6bed5ba6472";
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return weatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetch weather data");
    }
  }

  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text(
              "Weather App ☀️",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 137, 207, 240)),
        body: Center(
          child: ListView.builder(
            itemCount: weatherList.length,
            itemBuilder: (context, index) {
              weatherModel weather = weatherList[index];
              return ListTile(
                title: Text(cityList[index]),
                subtitle: Text(weather.description),
                trailing: Text("${weather.temp.toStringAsFixed(1)}C"),
              );
            },
          ),
        ));
  }
}

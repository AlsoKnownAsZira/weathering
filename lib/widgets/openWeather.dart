import 'package:flutter/material.dart';
import 'package:weathering/models/weatherModel.dart';

class openWeather extends StatelessWidget {
  final weatherModel weather;
  final String city;
  openWeather({required this.weather, required this.city});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Detail in $city",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 137, 207, 240),
      ),
    );
  }
}

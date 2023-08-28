import 'package:flutter/material.dart';
import 'package:weathering/models/weatherModel.dart';

class detailSearch extends StatelessWidget {
  final String city;
  final weatherModel weather;
  detailSearch({required this.city,required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Weather in $city, current temp ${weather.temp}"),
      ),
    );
  }
}

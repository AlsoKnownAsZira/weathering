import 'package:flutter/material.dart';
import 'package:weathering/pages/homepage.dart';

void main() {
  runApp(const weatheringApp());
}

class weatheringApp extends StatelessWidget {
  const weatheringApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherApp',
      home: homepage()
    );
  }
}


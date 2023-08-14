import 'package:flutter/material.dart';
import 'pages/homePage.dart';

void main() {
  runApp( weatheringApp());
}

class weatheringApp extends StatelessWidget {
  const weatheringApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WeatherApp', home: homePage()
    );
  }
}

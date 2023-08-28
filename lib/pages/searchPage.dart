import 'package:flutter/material.dart';
import 'package:weathering/models/weatherModel.dart';
import 'package:weathering/pages/detailSearch.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
class searchPage extends StatelessWidget {
  searchPage({super.key});
  TextEditingController weatherC = TextEditingController();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 137, 207, 240),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: TextField(
              controller: weatherC,
              decoration: InputDecoration(
                  hintText: 'Search...', border: InputBorder.none),
              keyboardType: TextInputType.text,
              onSubmitted: (value) async {
               if(weatherC.text.isNotEmpty){
                weatherModel weather = await getCurrentWeather(weatherC.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detailSearch(city: weatherC.text,weather: weather)
                    ));
               }
                
              },
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Enter the city name on the search bar above, keep in mind only major cities weather data are available",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

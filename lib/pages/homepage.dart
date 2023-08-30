import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weathering/models/weatherModel.dart';
import 'package:http/http.dart' as http;
import 'package:weathering/pages/searchPage.dart';
import 'dart:convert';
import 'package:weathering/widgets/openWeather.dart';

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

  //future builder alternative
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
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => searchPage(),
                        ));
                  },
                  icon: Icon(Icons.search))
            ],
            backgroundColor: Color.fromARGB(255, 137, 207, 240)),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.bottomLeft,
                width: double.infinity,
                height: 125,
                color: Color.fromARGB(255, 137, 207, 240),
                child: const Text(
                  "Weathering",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  ListTile(
                    leading: Icon(Icons.question_mark_sharp),
                    title: Text("More info about weather data"),
                    trailing: Icon(Icons.arrow_forward_ios_sharp),
                    onTap: () => sbs(0),
                  ),
                  ListTile(
                    leading: Icon(Icons.link),
                    title: Text("Sources"),
                    trailing: Icon(Icons.arrow_forward_ios_sharp),
                    onTap: () => sbs(1),
                  ),
                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text("About"),
                    trailing: Icon(Icons.arrow_forward_ios_sharp),
                    onTap: () => sbs(2),
                  )
                ],
              ))
            ],
          ),
        ),
        body: weatherList.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator()),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                          "Fetching data, please check your internet connection")),
                ],
              )
            : ListView.builder(
                itemCount: weatherList.length,
                itemBuilder: (context, index) {
                  weatherModel weather = weatherList[index];
                  return ListTile(
                      title: Text(cityList[index]),
                      subtitle: Text(weather.description),
                      trailing: Text("${weather.temp.toStringAsFixed(1)}°C"),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => openWeather(
                                weather: weather,
                                city: cityList[index],
                                index: index),
                          )));
                },
              ));
  }

  List<String> sbsList = [
    "According to openweathermap.org the displayed data has a precision of 1 hour accuracy.\nIf the City's image(not on searched city) Won't load, please recheck your internet connection.",
    "Sources:\nAPI: https://openweathermap.org/\nFun Facts: http://www.enjoytravel.com\nhttps://www.wunderlustlondon.co.uk/\nhttps://theplanetd.com/\nImages: https://images.unsplash.com/ ",
    "Practicing HTTP Request is the main reason why I create this app. If you stumble across any bugs or if you have any suggestions or if you just wanted the source code, feel free to contact me.\nThanks for testing, have a nice day!"
  ];
  sbs(int index) {
    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      builder: (context) => SizedBox(
        height: 175,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            sbsList[index],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
    );
  }
}

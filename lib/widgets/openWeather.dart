import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 137, 207, 240),
      ),
      body: Column(
        children: [
          Stack(
            alignment:Alignment.center,
            children:[

              Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(image: NetworkImage(cityPic[index]), fit: BoxFit.cover)),
            ),
             Container(
                width: double.infinity,
                height: 200,
                color: Color.fromARGB(99, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(city,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(weather.description,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),),
                     Text("${weather.temp.toStringAsFixed(1)}C",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
                    ],
                  )
                
                  ],
                ),
              ),
            
            
            ]
          ),
         
        ],
      ),
    );
  }
}

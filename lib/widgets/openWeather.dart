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
  List<String> facts = [
    'As of December 2019, Jakarta has 964 highrise buildings and 244 skyscrapers. As of July 2021, Jakarta has 46 skyscrapers that are taller than 200 meters. This means Jakarta has the highest number of 200-meter-plus skyscrapers out of all the Southeast Asian cities. It even has more high-rise buildings than that of Beijing. In 2015, workers in Jakarta constructed seven 200-meter-plus skyscrapers, which was the highest among the cities in the world during that year.',
    'The city of Seoul has had many different names. Seoul was called Wiryeseong during the Baekje era, one of the Three Kingdoms which ruled over ancient Korea from the 1st century BCE to the 7th century CE. Then, it was called Wiryeseong during the Goryeo era (918 - 1392). During the Joseon era (1392 until 1910) it was called Hanyang. During colonial times (1910 until 1945) it was called Keijo. In 1945, the city was officially named Seoul and was designated as a special city in 1949.',
    "One of Tokyo`s tallest freestanding towers, the Tokyo Tower, is inspired by the Eiffel Tower. Built in 1958, it soars 90 m (295 ft) high, making it taller than the Eiffel Tower itself. Authorities re-painted the structure orange and white to adhere to air regulation. The tower holds the master control over the Tokyo metropolitan area, broadcasting television signals, FM radio reception and transmission, traffic information transmission, as well as weather and air pollution data collection.",
    'People of Islam believe that Mecca was first inhabited by the descendants of Ishmael (the first son of Abraham). Muhammad, the founder of Islam and the proclaimer of the Qur`ān, was born in Mecca in 570. Because Mecca is a city of Islam, strict laws are enforced and the government of Saudi Arabia forbids all non-Muslims from entering the holy city of Mecca.',
    'Berlin might be the capital city, but it`s not all soaring skyscrapers and bureaucratic buildings. It`s the greenest city in the country. Around 30 per cent of the city is open green space and woodlands. There are some 431,000 trees lining the streets, as well as 2,500 parks. As if that`s not enough, there`s an additional 890 allotment gardens with over 71,000 gardens across the city.',
    'Big Ben isn`t actually the name of the tower which was called “The Clock Tower” for decades and was renamed “Elizabeth Tower” in 2012. Rather, Big Ben is actually the name of the bell inside the tower, not the tower itself. And oh, in case you`re wondering, the bell is tuned to the key of E.',
    'Paris`s original name was Lutetia Parisiorum (called Lutèce in French)  and the settlers there were Celts known as the “Parisii.” It is commonly believed that “Lutetia” comes from the Latin word lutum meaning "mud" or "swamp". So the elegant, glittering city that we all know and love, most likely was first known as mud town of the Parisii',
    'Encompassing more than 15 buildings, 20 towers and more than 1.5 miles of walls, the Moscow Kremlin is the world`s largest medieval fortress and the largest active fortress in Europe. Set in the heart of Moscow`s Red Square, the Kremlin complex is separated by a 30-metre moat and comprises five palaces, four cathedrals, and some of the country`s most important relics too, including most of the Tsar`s coronation robes, jewellery and armour in the Armoury Palace.',
    'It is somewhat ironic that Lady Liberty is an iconic symbol of freedom and the American Dream when she started her life in Paris. French sculptors Bartholdi and Eiffel built her to celebrate the friendship between the US and France. n 1885, they sent Lady Liberty in 350 pieces packed into 214 crates. Though her flame-holding right arm arrived much earlier in 1876. So, the Americans displayed it in Philadelphia until the rest caught up with her.',
    'Australian food is famous because of its meaty dishes. Angus beef is one of the widely used meats in Canberra. People mainly use this premium cut for making delicious steaks in this city. Meanwhile, roast lamb is considered the national dish of Australia in various cities such as Canberra.'
  ];
  @override
  Widget build(BuildContext context) {
    DateTime localTime = DateTime.now().add(Duration(
        seconds: weather.time - DateTime.now().timeZoneOffset.inSeconds));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 137, 207, 240),
      ),
      body: SingleChildScrollView(
        child: Column(
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "🌡️  Feels Like:              ${weather.feelsLike.toStringAsFixed(1)}°C",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Row(
                children: [
                  Text(
                      "📈  Highest Temp:       ${weather.high.toStringAsFixed(1)}°C",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: [
                  Text(
                      "📉  Lowest Temp:        ${weather.low.toStringAsFixed(1)}°C",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Row(
                children: [
                  Text(
                      "💧  Humidity:                ${weather.humidity.toStringAsFixed(1)}%",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: [
                  Text(
                      "🍃  Wind Speed:          ${weather.windSpeed.toStringAsFixed(1)}meter/sec",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Row(
                children: [
                  Text(
                      "⏰  Local Timezone:   ${DateFormat("HH:mm").format(localTime)}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                ],
              ),
            ),
           const Padding( 
              padding:  EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 5),
              child:  Row(
                children: [
                  Text(
                    "🤓  Fun Fact:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
            child: Text(facts[index], style: TextStyle(fontSize: 15),),
            )
          ],
        ),
      ),
    );
  }
}

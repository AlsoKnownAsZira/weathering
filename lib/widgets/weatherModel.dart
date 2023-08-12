class weatherModel {
  late double temp;
  late double feelsLike;
  late double low;
  late double high;
  late String description;

  weatherModel({required this.temp,required this.feelsLike,required this.low,required this.high,required this.description});

  factory weatherModel.fromJson(Map<String, dynamic> json) {
    return weatherModel(
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      low: json['main']['temp_min'].toDouble(),
      high: json['main']['temp_max'].toDouble(),
      description: json['weather'][0]['description'],
    );
  }
}

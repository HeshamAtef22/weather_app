import 'package:flutter/foundation.dart';

class WeatherModel{
  String date;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherStateName;

  WeatherModel({required this.date, required this.temp, required this.minTemp, required this.maxTemp, required this.weatherStateName});

  //هعمل نيمد كونستراكتور احول فيه الداتا
factory WeatherModel.fromJson(dynamic data){
  var jsonData = data["forecast"]["forecastday"][0]["day"];

  return WeatherModel(
    date: data["location"]["localtime"],
    temp: jsonData['avgtemp_c'],
    minTemp: jsonData['mintemp_c'],
    maxTemp: jsonData['maxtemp_c'],
    weatherStateName: jsonData['condition']['text'],
  );
}

@override
  String toString() {
    return 'WeatherModel{date: $date, temp: $temp, minTemp: $minTemp, maxTemp: $maxTemp, weatherStateName: $weatherStateName}';
  }
}
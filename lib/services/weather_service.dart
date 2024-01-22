import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {

  Future<WeatherModel> getWeather({required String cityName}) async{
    String baseUrl = "http://api.weatherapi.com/v1";
    String apiKey = "79b7af8d9a0145f683b134506230512";
    Uri url = Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7");
    http.Response response = await http.get(url);
    Map<String , dynamic> data = jsonDecode(response.body);


    WeatherModel weather = WeatherModel.fromJson(data);
    print(weather);

    return weather;
  }
}
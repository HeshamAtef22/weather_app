import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});

  String? cityName;

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
                suffixIcon: Icon(Icons.search),
                hintText: 'Enter a city',
                label: Text('Search'),
                border: OutlineInputBorder(),
              ),
              onSubmitted:  (onValue)async{
                cityName = onValue;

                WeatherService service = WeatherService();
               WeatherModel Weather=await service.getWeather(cityName: cityName!);
               print(Weather);
              },
            ),
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height *.60,
            width:  MediaQuery.of(context).size.width,
            child: FittedBox(
                fit: BoxFit.contain,
                child: Lottie.asset(
                    "assets/animations/Animation - 1701809299148.json")),
          ),
        ],
      ),
    );
  }
}

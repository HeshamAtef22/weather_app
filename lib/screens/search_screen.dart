import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key, required this.updateUi});

   //هعمل متغير علشان اباصي من خلاله فانكشن السيت استيت الموجوده في الهوم سكرين
   VoidCallback updateUi;

  String? cityName;



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
              onSubmitted:  (data)async{
                cityName = data;

                WeatherService service = WeatherService();
               WeatherModel Weather=await service.getWeather(cityName: cityName!);
               weatherData = Weather;
               print(weatherData!.temp);
               //استدعي الميثود ابديت يو اي وانت بترجع للصفحة اللي قبلها
               updateUi();
               Navigator.pop(context);
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

WeatherModel? weatherData;
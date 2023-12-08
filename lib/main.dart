import 'package:flutter/material.dart';
import 'package:weather_app/screens/homescreen.dart';

void main() {
  runApp( WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      home: HomeScreen(),
    );
  }
}

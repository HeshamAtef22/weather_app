import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( WeatherApp());
}

class WeatherApp extends StatelessWidget {
   WeatherApp({super.key});

   //هعمل اوبجيكت للداتا اللي عايز اشاركها وانا هنا عايز اشارك الدات اللي هترجع في الاي بي اي فعمل منها اوبجيكت وامرره للبروفايدر
  WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => weather,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:  ThemeData(
          scaffoldBackgroundColor: Colors.white
        ),
        home: HomeScreen(),
      ),
    );
  }
}

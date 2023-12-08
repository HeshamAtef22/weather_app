import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

   WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade100,
          title: Text('Weather App'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
              },
            ),
          ],
        ),
        body: weatherData != null ? Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome to the Weather App!☂️🧐',
                style: TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
              Text(
                'Searching for a city...🔎',
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ) : Container(
          color: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Text(
                'Cairo',style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.bold),
              ),
              Text(
                "Updated 12:11 PM",
                style: TextStyle(fontSize: 22.0,),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/clear.png',height: 80.0,width: 80.0,),
                  Text(
                    'Cairo',style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text('maxTemp : 30'),
                      Text('minTemp : 20'),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Text(
                'Clear',style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.bold),
              ),
              Spacer(flex: 2),
            ]
          ),
        ),
    );
  }
}

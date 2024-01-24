import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //طريقة نقل الداتا عن طريق الجلوبال فار
  //هعمل ميثود افعل بيها السيت ستيت علشان اعمل ريبيلد وانا بتقبل الداتا من الجلوبال
  //فار فيعمل ريبيلد للسكرين وهو راجع
  void updateUi(){
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade100,
          title: const Text('Weather App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(
                  updateUi: updateUi,
                )));
              },
            ),
          ],
        ),
        //هعمل كونديشن علي الداتا او الاوبجيكت اللي بيحتوي ع الداتا في البروفايدر لو بنل او لا
        body: Provider.of<WeatherProvider>(context).weatherData == null ?
        const Center(
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
        )
            : Container(
          color: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
               Text(
                '${Provider.of<WeatherProvider>(context).weatherData!.date}',style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.bold),
              ),
              const Text(
                "Updated 12:11 PM",
                style: TextStyle(fontSize: 22.0,),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/clear.png',height: 80.0,width: 80.0,),
                  const Text(
                    'Cairo',style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.bold),
                  ),
                  const Column(
                    children: [
                      Text('maxTemp : 30'),
                      Text('minTemp : 20'),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const Text(
                'Clear',style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.bold),
              ),
              const Spacer(flex: 2),
            ]
          ),
        ),
    );
  }
}



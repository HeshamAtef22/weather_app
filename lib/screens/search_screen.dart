import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
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
               //هستدعي الاوبجيكت او الكلاس اللي بيحتوي ع الاوبجيكت اللي محتاج اكسس عليه وهممر نوع الكلاس دا وانا بستدعيه
               //قولتله هنا خد الداتا الخاصه بالاوبجيكت اللي في السكرين دا اللي اسمه ويزر ومررها للاوبجيكت اللي في الكلاس ويزر بروفايدر علشان اقدر استخدمها بعد كدا في اي مكان تاني
                Provider.of<WeatherProvider>(context,listen: false).weatherData = Weather;
                //listen: false خلتها الليسن هنا بفولس لانه هيديني اكسبشن لازم اقوله اسمع للتغيرات اللي بتحصل للبروفايدر او لا وفي حاة اني بمرر
                //داتا للبروفايدر فانا مش عايز اسمع للتغيرات انا بس بمرر داتا علي عكس لو بستدعي لازم تكون ترو علشان اسمع لاي تغيير بيحصل
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


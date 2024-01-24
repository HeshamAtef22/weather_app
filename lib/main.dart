import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( WeatherApp());
}

class WeatherApp extends StatelessWidget {
   WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    //هراب الماتريال ب شينج نوتيفاير بروفايدر علشان يسمع للتغيرات اللي بتحصل اول بأول ويريبيلد السكرين بسهوله
    //الفرق بينها وبين البروفايدر العادي ان البروفايدر بستخدم بس لو هبعت بيانات مش اكتر
    return ChangeNotifierProvider(
      //create دا اتربيوت بمررله الداتا اللي هعملها مشاركة علي مستوي السكرينات او الويدجيتس وهنا انا هبعتلها الكلاس
      //اللي جواه الاوبجيكت او ادات اللي محتاج اشيرها علي مستوي الابلكيشن
      create: (context) => WeatherProvider(),
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

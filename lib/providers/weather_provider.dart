import 'package:flutter/foundation.dart';
import 'package:weather_app/models/weather_model.dart';


//هرث هنا من الشينج نوتيفير علان استخدم الميثود الخاصه بيه اللي اسمها نوتيفاي ليسنرز
//مهمتها انها بتسمع التغيرات اللي بتحصل وبتنفذها او بتعمل ابديت للداتا بتاعتي وال ui
class WeatherProvider extends ChangeNotifier{
  //هخلي المتغير برايفيت واعمله سيتر وجيتر علشان اعرف اكسس الداتا اللي فيه
  //ودا مش حاجه اساسية يعني ممكن اخليه متغير عادي بدون ما اعمله برايفيت ولا سيتر وجيتر واكسس عليه عادي
  WeatherModel? _weatherData;

  //هعمل سيت للداتا وهستقبل فيه اتربيوت من نوع الويزر مودل علشان امرره للبرايفيت داتا بتاعتي واعملها سيت
  set weatherData (WeatherModel? weather){
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;

}
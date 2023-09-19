import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:whether/app/model/current_weather_model.dart';
import 'package:whether/app/model/hour_weather_model.dart';
import 'package:whether/utils/constants/api_const.dart';

var link = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
var hourLink = 'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';




getCurrentWeather()async{
   var res = await http.get(Uri.parse(link));
   if(res.statusCode == 200){
    var data = currentWeatherDataFromJson(res.body.toString());
    log("data recieved");
    return data;
   }
}
getHourWeather()async{
   var res = await http.get(Uri.parse(hourLink));
   if(res.statusCode == 200){
    var data = hourlyWeatherDataFromJson(res.body.toString());
    log("Hourdata recieved");
    return data;
   }
}
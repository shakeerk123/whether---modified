import 'package:flutter/material.dart';

const String degree = "°";
const String apiKey ="Your API key ";
const String currentEndpoint ="https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}";
const String daysEndpoint ="api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid={API key}";
const  String latitude ='12.507643';
const  String longitude ='74.988213';

class Constants {
// ----------home---------

  static String sunPng = "assets/weather/01d.png";
  static String cloudyrain = "assets/weather/09n.png";

  static Text degree =  Text(
    "37$degree",
    style: const TextStyle(
      fontFamily: "poppins",
      fontSize: 66,
      color: Colors.black
    ),
  );



// ----------icon---------

   static Icon rounded  = Icon(Icons.expand_less_rounded,color: Colors.grey,);
   static Icon expand  = Icon(Icons.expand_more_rounded,color: Colors.grey,);
}

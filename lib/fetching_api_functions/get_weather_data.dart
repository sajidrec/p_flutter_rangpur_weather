import 'dart:convert';

import 'package:http/http.dart' as http;

Future getWeatherData() {
  const apiEndPoint =
      "https://api.weatherapi.com/v1/forecast.json?key=06ea070b6d9f438987585223232609&q=Rangpur&days=7&aqi=yes&alerts=yes";
  return http.get(Uri.parse(apiEndPoint));
}



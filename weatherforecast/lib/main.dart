import 'package:flutter/material.dart';
import 'package:weatherforecast/weather_forecast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Forecast',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: WeatherForecast(),
    );
  }
}


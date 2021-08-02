import 'package:flutter/material.dart';
import 'package:weatherforecast/model/weather_forecast_model.dart';
import 'package:weatherforecast/network/network.dart';

class WeatherForecast extends StatefulWidget {
  WeatherForecast({Key key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecastObject;
  String _cityName = 'Sarajevo';

  @override
  void initState() {
   
   forecastObject = Network().getWeatherForecast(cityName: _cityName);

   forecastObject.then((value){
    return print(value.list[0].weather[1].main);
   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forecast'),
      ),
      // body: Container(
        
      //   child: FutureBuilder(
      //     future: forecastObject,
      //     builder: (context, snapshot){
      //     var data = snapshot.data;
      //     return Text(data);
      //   }),
      // )
    );
  }
}

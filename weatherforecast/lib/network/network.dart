import 'dart:convert';

import 'package:weatherforecast/model/weather_forecast_model.dart';
import 'package:weatherforecast/util/forecast_util.dart';
import 'package:http/http.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast({String cityName}) async {
    var url =
        'http://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=${Util.appId}&units=metric&cnt=7';

    final response = await get(Uri.parse(Uri.encodeFull(url)));

    if (response.statusCode == 200) {
      print("Vrijeme je: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error getting weathear forecast');
    }
  }
}

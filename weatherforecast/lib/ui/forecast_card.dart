import 'package:flutter/material.dart';
import 'package:weatherforecast/model/weather_forecast_model.dart';
import 'package:weatherforecast/util/convert_icon.dart';
import 'package:weatherforecast/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 100);
  var fullDate = Util.getFormattedDate(date);

  dayOfWeek = fullDate.split(',')[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 33,
              child: getWeatherIcon(
                  weatherDescription: forecastList[index].weather[0].description,
                  color: Colors.pinkAccent,
                  size: 38),
            ),
          )
        ],
      )
    ],
  );
}

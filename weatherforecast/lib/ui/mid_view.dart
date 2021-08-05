import 'package:flutter/material.dart';
import 'package:weatherforecast/model/weather_forecast_model.dart';
import 'package:weatherforecast/util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel>snapshot){
  var forecastList = snapshot.data.list;
  var city = snapshot.data.city.name;
    var country = snapshot.data.city.country;
    var formattedDate =DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
        Container midView = Container(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('$city, $country', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
                ),),
                Text('${Util.getFormattedDate(formattedDate)}')
      ],
    ),
          ),
  );
  return midView;
}
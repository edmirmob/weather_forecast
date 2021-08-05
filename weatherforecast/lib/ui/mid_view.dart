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
                Text('${Util.getFormattedDate(formattedDate)}', style: TextStyle(fontSize: 15),),

                SizedBox(height: 10,),

                Icon(Icons.wb_sunny, size: 195,),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical:12.0, horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${forecastList[0].main.temp.toStringAsFixed(1)}°C', style: TextStyle(fontSize: 34),),
                      SizedBox(width: 5,),
                      Text('${forecastList[0].weather[0].description.toUpperCase()}'),
                    ],
                  ),
                )
      ],
    ),
          ),
  );
  return midView;
}
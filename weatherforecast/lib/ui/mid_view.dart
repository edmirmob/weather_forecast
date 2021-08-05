import 'package:flutter/material.dart';
import 'package:weatherforecast/model/weather_forecast_model.dart';
import 'package:weatherforecast/util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data.list;
  var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;
  var formattedDate =
      DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
  var forecast = forecastList[0];
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '$city, $country',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          Text(
            '${Util.getFormattedDate(formattedDate)}',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Icon(
            Icons.wb_sunny,
            size: 195,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${forecast.main.temp.toStringAsFixed(1)}°C',
                  style: TextStyle(fontSize: 34),
                ),
                SizedBox(
                  width: 5,
                ),
                Text('${forecast.weather[0].description.toUpperCase()}'),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '${forecast.wind.speed.toStringAsFixed(1)} mi/h',
                        style: TextStyle(fontSize: 20, color: Colors.brown),
                      ),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '${forecast.main.humidity.toStringAsFixed(0)}%',
                        style: TextStyle(fontSize: 20, color: Colors.brown),
                      ),
                      Icon(Icons.hot_tub)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '${forecast.main.tempMax.toStringAsFixed(1)}°C',
                        style: TextStyle(fontSize: 20, color: Colors.brown),
                      ),
                      Icon(Icons.wb_sunny)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
  return midView;
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherforecast/model/weather_forecast_model.dart';
import 'package:weatherforecast/util/convert_icon.dart';
import 'package:weatherforecast/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index, BuildContext context) {
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
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 33,
              child: getWeatherIcon(
                  weatherDescription: forecastList[index].weather[0].description,
                  color: Colors.pinkAccent,
                  size: 38),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right:5),
                      child: Text('${forecastList[index].main.tempMin}°C'),
                    ),
                    Icon(FontAwesomeIcons.solidArrowAltCircleDown, color: Colors.white,size: 17,)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right:5),
                      child: Text('${forecastList[index].main.tempMax}°C'),
                    ),
                    Icon(FontAwesomeIcons.solidArrowAltCircleUp, color: Colors.white,size: 17,)
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:2.0),
                      child: Text('Hum:${forecastList[index].main.humidity}%', overflow: TextOverflow.ellipsis,),
                    ),
                    // Icon(FontAwesomeIcons.solidGrinBeamSweat, color: Colors.white,size: 17,)

                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:2.0),
                      child: Text('Win:${forecastList[index].wind.speed.toStringAsFixed(1)} mi/h'),
                    ),
                    // Icon(FontAwesomeIcons.arrowCircleDown, color: Colors.white,)
                  ],
                )
              ],
            ),
          )
        ],
      )
    ],
  );
}

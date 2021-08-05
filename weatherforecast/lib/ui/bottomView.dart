import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherforecast/model/weather_forecast_model.dart';
import 'package:weatherforecast/ui/forecast_card.dart';

Widget bottomView(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data.list;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        '7-day Weather Forecast'.toUpperCase(),
        style: TextStyle(fontSize: 14, color: Colors.black87),
      ),
      Container(
        height: 170,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.7,
                  height: 160,
                  child: forecastCard(snapshot, index),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Color(0xff9661C3),
                      Color(0xffccff66),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
                  width: 8,
                ),
            itemCount: forecastList.length),
      )
    ],
  );
}
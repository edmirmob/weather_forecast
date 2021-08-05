import 'package:flutter/material.dart';
import 'package:weatherforecast/model/weather_forecast_model.dart';
import 'package:weatherforecast/network/network.dart';
import 'package:weatherforecast/ui/mid_view.dart';

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
    forecastObject = getWeather(cityName: _cityName);

    forecastObject.then((value) {
      return print(value.list[0].weather[0].main);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        textFielView(),
        Container(
          child: FutureBuilder(
              future: forecastObject,
              builder: (context, AsyncSnapshot<WeatherForecastModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                       midView(snapshot),
                    ],
                  );
                } else {
                  return Container(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              }),
        ),
      ],
    ));
  }

  Widget textFielView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Enter City Name',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(8)),
        onSubmitted: (value) {
          setState(() {
            _cityName=value;
            forecastObject = getWeather(cityName:_cityName);
          });
        },
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({String cityName}) => Network().getWeatherForecast(cityName: _cityName);
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherforecast/model/weather_forecast_model.dart';
import 'package:weatherforecast/util/convert_icon.dart';
import 'package:weatherforecast/util/forecast_util.dart';

class MidView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel>snapshot;
  const MidView({ this.snapshot }) : super();

  @override
  Widget build(BuildContext context) {
    var forecast = snapshot.data.list[0];
    var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;
  var formattedDate =
      DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000);
    return Container(
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
          getWeatherIcon(
            weatherDescription: forecast.weather[0].main,
            size: 198,
            color: Colors.pink.shade200,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${forecast.main.temp.toStringAsFixed(0)}°C',
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
                      ),
                      Icon(FontAwesomeIcons.wind,
                          size: 20, color: Colors.brown),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '${forecast.main.humidity.toStringAsFixed(0)}%',
                      ),
                      Icon(FontAwesomeIcons.solidGrinBeamSweat,
                          size: 20, color: Colors.brown),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '${forecast.main.tempMax.toStringAsFixed(1)}°C',
                      ),
                      Icon(FontAwesomeIcons.temperatureHigh,
                          size: 20, color: Colors.brown),
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
  }
}

// Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
//   var forecastList = snapshot.data.list;
//   var city = snapshot.data.city.name;
//   var country = snapshot.data.city.country;
//   var formattedDate =
//       DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
//   var forecast = forecastList[0];
//   Container midView = Container(
//     child: Padding(
//       padding: const EdgeInsets.all(14.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Text(
//             '$city, $country',
//             style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87),
//           ),
//           Text(
//             '${Util.getFormattedDate(formattedDate)}',
//             style: TextStyle(fontSize: 15),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           getWeatherIcon(
//             weatherDescription: forecastList[0].weather[0].main,
//             size: 198,
//             color: Colors.pink.shade200,
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   '${forecast.main.temp.toStringAsFixed(0)}°C',
//                   style: TextStyle(fontSize: 34),
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Text('${forecast.weather[0].description.toUpperCase()}'),
//               ],
//             ),
//           ),
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Text(
//                         '${forecast.wind.speed.toStringAsFixed(1)} mi/h',
//                       ),
//                       Icon(FontAwesomeIcons.wind,
//                           size: 20, color: Colors.brown),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Text(
//                         '${forecast.main.humidity.toStringAsFixed(0)}%',
//                       ),
//                       Icon(FontAwesomeIcons.solidGrinBeamSweat,
//                           size: 20, color: Colors.brown),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Text(
//                         '${forecast.main.tempMax.toStringAsFixed(1)}°C',
//                       ),
//                       Icon(FontAwesomeIcons.temperatureHigh,
//                           size: 20, color: Colors.brown),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     ),
//   );
//   return midView;
// }

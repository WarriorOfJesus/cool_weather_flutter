import 'package:cool_weather_flutter/models_response/weather_forecast_response.dart';
import 'package:cool_weather_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastResponse> snapshot;

  const CityView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var cityName = snapshot.data?.city?.name;
    var country = snapshot.data?.city?.country;
    var foreCastList = snapshot.data?.weatherList;
    var time = foreCastList?[0].dt;
    var dateTime;

    if (time != null) {
      dateTime = DateTime.fromMillisecondsSinceEpoch((time * 1000));
    } else {
      dateTime = 0;
    }

    return Container(
        color: Color(0x3C335E),
        child: Column(
          children: [
            Text(
              '$cityName, $country',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            Text(
              Utils.getFormattedDate(dateTime),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
            )
          ],
        ),
      );

  }
}

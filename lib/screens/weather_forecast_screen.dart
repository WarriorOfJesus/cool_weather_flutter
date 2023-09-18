import 'dart:developer';

import 'package:cool_weather_flutter/api/weather_api.dart';
import 'package:cool_weather_flutter/models_response/weather_forecast_response.dart';
import 'package:flutter/material.dart';

class WeatherForeCastScreen extends StatefulWidget {
  const WeatherForeCastScreen({super.key});

  @override
  State<WeatherForeCastScreen> createState() => _WeatherForeCastScreenState();
}

class _WeatherForeCastScreenState extends State<WeatherForeCastScreen> {
  late Future<WeatherForecastResponse> forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();
    forecastObject = WeatherApi().getWeatherForecastWithCity(cityName: _cityName);

    forecastObject.then((weather) {
      log('______response from init bloc: ${weather.weatherList?[0].weather?[0].description}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

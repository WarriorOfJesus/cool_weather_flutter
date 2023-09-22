import 'package:cool_weather_flutter/models/clouds_data.dart';
import 'package:cool_weather_flutter/models/main_weather_data.dart';
import 'package:cool_weather_flutter/models/rain.dart';
import 'package:cool_weather_flutter/models/sys.dart';
import 'package:cool_weather_flutter/models/weather_data.dart';
import 'package:equatable/equatable.dart';

class WeatherDataList extends Equatable {
  final int? dt;
  final MainWeatherData? main;
  final List<WeatherData>? weather;
  final Clouds? clouds;
  final int? visibility;
  final num? pop;
  final Rain? rain;
  final Sys? sys;
  final String? dtTxt;

  const WeatherDataList({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.visibility,
    required this.pop,
    required this.rain,
    required this.sys,
    required this.dtTxt,
  });

  @override
  List<Object?> get props => [dt, main, weather, clouds, visibility, pop, rain, sys, dtTxt];
}

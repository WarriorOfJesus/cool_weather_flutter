import 'package:cool_weather_flutter/models/weather_data_list.dart';
import 'package:cool_weather_flutter/models_response/city_response.dart';
import 'package:equatable/equatable.dart';

import 'city.dart';

class WeatherForecast extends Equatable {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<WeatherDataList>? weatherList;
  final City? city;

  const WeatherForecast({required this.cod,
    required this.message,
    required this.cnt,
    required this.weatherList,
    required this.city});

  static final empty = WeatherForecast(cod: '',
    message: 0,
    cnt: 0,
    weatherList: List.empty(),
    city: City.emptyCity,);

  @override
  List<Object?> get props => [cod, message, cnt, weatherList, city];
}

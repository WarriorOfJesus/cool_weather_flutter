import 'package:cool_weather_flutter/models/weather_data_list.dart';
import 'package:cool_weather_flutter/models_response/city_response.dart';
import 'package:equatable/equatable.dart';

class WeatherForecast extends Equatable {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<WeatherDataList>? weatherList;
  final CityResponse? city;
  
  const WeatherForecast(
      {this.cod, this.message, this.cnt, this.weatherList, this.city});

  @override
  List<Object?> get props => [cod, message, cnt, weatherList, city];
}

import 'package:cool_weather_flutter/models_response/city_response.dart';
import 'package:cool_weather_flutter/models_response/weather_data_list_response.dart';
import 'package:equatable/equatable.dart';

class WeatherForecastResponse extends Equatable {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<WeatherDataListResponse>? weatherList;
  final CityResponse? city;
  

  const WeatherForecastResponse(
      {this.cod, this.message, this.cnt, this.weatherList, this.city});

  WeatherForecastResponse.fromJson(Map<String, dynamic> json)
      : cod = json['cod'],
        message = json['message'],
        cnt = json['cnt'],
        weatherList = json['list'] is List
            ? (json['list'] as List<dynamic>).map((e) => WeatherDataListResponse.fromJson(e)).toList()
            : null,
        city = json['city']!= null ? CityResponse.fromJson(json['city']) : null;

  Map<String, dynamic> toJson() =>{
  'cod' : cod,
  'message' : message,
  'cnt' : cnt,
  'list' : weatherList?.map((e) => e.toJson()).toList(),
  'city' :city?.toJson()
  };

  @override
  List<Object?> get props => [cod, message, cnt, weatherList, city];
}

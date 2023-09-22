import 'package:cool_weather_flutter/models_response/sys_response.dart';
import 'package:cool_weather_flutter/models_response/clouds_data_response.dart';
import 'package:cool_weather_flutter/models_response/main_weather_data_response.dart';
import 'package:cool_weather_flutter/models_response/rain_response.dart';
import 'package:cool_weather_flutter/models_response/weather_data_response.dart';
import 'package:equatable/equatable.dart';

class WeatherDataListResponse extends Equatable {
  final int? dt;
  final MainWeatherDataResponse? main;
  final List<WeatherDataResponse>? weather;
  final CloudsResponse? clouds;
  final int? visibility;
  final num? pop;
  final RainResponse? rain;
  final SysResponse? sys;
  final String? dtTxt;

  const WeatherDataListResponse({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.visibility,
    this.pop,
    this.rain,
    this.sys,
    required this.dtTxt,
  });

  WeatherDataListResponse.fromJson(Map<String, dynamic> json)
      : dt = json['dt'],
        main = json['main'] != null ? MainWeatherDataResponse.fromJson(json['main']) : null,
        weather = json['weather'] is List
            ? (json['weather'] as List<dynamic>).map((e) => WeatherDataResponse.fromJson(e)).toList()
            : null,
        clouds = json['clouds'] != null ? CloudsResponse.fromJson(json['clouds']) : null,
        visibility = json['visibility'],
        pop = json['pop'],
        rain = json['rain'] != null ? RainResponse.fromJson(json['rain']) : null,
        sys = json['sys'] != null ? SysResponse.fromJson(json['sys']) : null,
        dtTxt = json['dt_txt'];

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'main': main?.toJson(),
        'weather': weather?.map((e) => e.toJson()).toList(),
        'clouds': clouds?.toJson(),
        'visibility': visibility,
        'pop': pop,
        'rain': rain?.toJson(),
        'sys': sys?.toJson(),
        'dt_txt': dtTxt,
      };

  @override
  List<Object?> get props => [dt, main, weather, clouds, visibility, pop, rain, sys, dtTxt];
}

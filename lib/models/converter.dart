import 'package:cool_weather_flutter/models/coord.dart';
import 'package:cool_weather_flutter/models/rain.dart';
import 'package:cool_weather_flutter/models/sys.dart';
import 'package:cool_weather_flutter/models/weather_data.dart';
import 'package:cool_weather_flutter/models/weather_data_list.dart';
import 'package:cool_weather_flutter/models/weather_forecast.dart';
import 'package:cool_weather_flutter/models_response/clouds_data_response.dart';
import 'package:cool_weather_flutter/models_response/main_weather_data_response.dart';
import 'package:cool_weather_flutter/models_response/weather_data_list_response.dart';
import 'package:cool_weather_flutter/models_response/weather_data_response.dart';
import 'package:cool_weather_flutter/models_response/weather_forecast_response.dart';

import '../models_response/city_response.dart';
import '../models_response/coord_response.dart';
import '../models_response/rain_response.dart';
import '../models_response/sys_response.dart';
import 'city.dart';
import 'clouds_data.dart';
import 'main_weather_data.dart';

class WeatherConverter {
  WeatherForecast fromNetworkWeatherForecast(WeatherForecastResponse response) {
    return WeatherForecast(
      cod: response.cod,
      message: response.message,
      cnt: response.cnt,
      weatherList: _fromNetworkWeatherDataList(response.weatherList),
      city: _fromNetworkCity(response.city),
    );
  }

  List<WeatherDataList> _fromNetworkWeatherDataList(List<WeatherDataListResponse>? response) {
    var list = response?.map((WeatherDataListResponse data) {
          return WeatherDataList(
            dt: data.dt,
            main: _fromNetworkMainWeatherData(data.main),
            weather: _fromNetworkListWeatherData(data.weather),
            clouds: _fromNetworkClouds(data.clouds),
            visibility: data.visibility,
            pop: data.pop,
            rain: _fromNetworkRain(data.rain),
            sys: _fromNetworkSys(data.sys),
            dtTxt: data.dtTxt,
          );
        }).toList() ??
        [];
    return list;
  }

  MainWeatherData _fromNetworkMainWeatherData(MainWeatherDataResponse? response) {
    return MainWeatherData(
        temp: response?.temp,
        feelsLike: response?.feelsLike,
        tempMin: response?.tempMin,
        tempMax: response?.tempMax,
        pressure: response?.pressure,
        seaLevel: response?.seaLevel,
        grndLevel: response?.grndLevel,
        humidity: response?.humidity,
        tempKf: response?.tempKf);
  }

  List<WeatherData> _fromNetworkListWeatherData(List<WeatherDataResponse>? response) {
    var list = response?.map((WeatherDataResponse data) {
          return WeatherData(
            id: data.id,
            main: data.main,
            description: data.description,
            icon: data.icon,
          );
        }).toList() ??
        [];
    return list;
  }

  Clouds _fromNetworkClouds(CloudsResponse? response) {
    return Clouds(all: response?.all);
  }

  Rain _fromNetworkRain(RainResponse? response) {
    return Rain(threeH: response?.threeH);
  }

  Sys _fromNetworkSys(SysResponse? response) {
    return Sys(pod: response?.pod);
  }
  Coord _fromNetworkCoord(CoordResponse? response) {
    return Coord(lat: response?.lat, lon: response?.lat);
  }

  City _fromNetworkCity(CityResponse? response) {
    return City(
      id: response?.id,
      name: response?.name,
      coord: _fromNetworkCoord(response?.coord),
      country: response?.country,
      population: response?.population,
      timezone: response?.timezone,
      sunrise: response?.sunrise,
      sunset: response?.sunset,
    );
  }
}

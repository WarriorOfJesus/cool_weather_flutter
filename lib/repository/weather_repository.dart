import 'package:cool_weather_flutter/api/weather_api.dart';
import 'package:cool_weather_flutter/models/converter.dart';
import 'package:cool_weather_flutter/models/weather_forecast.dart';

class WeatherRepository {
  final WeatherApi weatherApi;

  const WeatherRepository(this.weatherApi);

  Future<WeatherForecast> getWeatherForCity(String cityName) async {
    final response = await weatherApi.getWeatherForecastWithCity(cityName: cityName);
    return WeatherConverter().fromNetworkWeatherForecast(response);
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:cool_weather_flutter/models_response/weather_forecast_response.dart';
import 'package:cool_weather_flutter/utils/constants.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecastResponse> getWeatherForecastWithCity({required String cityName}) async {
    var queryParameters = {
      'appid': Constants.WEATHER_API_KEY,
      'units': 'metric',
      'q': cityName,
    };

    var uri =
        Uri.https(Constants.WEATHER_BASS_URL, Constants.WEATHER_FORECAST_PATH, queryParameters);

    log('request : ${uri.toString()}');

    var response = await http.get(uri);

    if(response.statusCode == 200){
      log('response: ${response.body}');
      return WeatherForecastResponse.fromJson(json.decode(response.body));
    }else{
      throw Exception('Error response');
    }
  }
}

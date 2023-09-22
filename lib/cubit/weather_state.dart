import 'package:cool_weather_flutter/models/weather_forecast.dart';
import 'package:equatable/equatable.dart';

enum WeatherStatus { initial, loading, success, failure }

extension WeatherStatusX on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;

  bool get isLoading => this == WeatherStatus.loading;

  bool get isSuccess => this == WeatherStatus.success;

  bool get isFailure => this == WeatherStatus.failure;
}

final class WeatherState extends Equatable {
  WeatherState({
    this.status = WeatherStatus.initial,
    WeatherForecast? weather,
  }) : weather = weather ??
            WeatherForecast(cod: '', message: 0, cnt: 0, weatherList: List.empty(), city: null);

  final WeatherStatus status;
  final WeatherForecast weather;

  WeatherState copyWith({
    WeatherStatus? status,
    WeatherForecast? weather,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather
    );
  }

@override
List<Object?> get props =>[status, weather];
}

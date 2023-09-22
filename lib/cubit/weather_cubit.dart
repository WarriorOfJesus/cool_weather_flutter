import 'package:cool_weather_flutter/cubit/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/weather_repository.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(WeatherState());
  final WeatherRepository _weatherRepository;

  Future<void> fetchWeather(String? cityName) async {
    emit(state.copyWith(status: WeatherStatus.initial));
    if (cityName == null || cityName.isEmpty) return;
    emit(state.copyWith(status: WeatherStatus.loading));
    try {
      final weather = await _weatherRepository.getWeatherForCity(cityName);

      emit(state.copyWith(status: WeatherStatus.success, weather: weather));
    } on Exception {
      emit(state.copyWith(status: WeatherStatus.failure));
    }

  }
}

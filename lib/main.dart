import 'package:cool_weather_flutter/api/weather_api.dart';
import 'package:cool_weather_flutter/cubit/weather_cubit.dart';
import 'package:cool_weather_flutter/repository/weather_repository.dart';
import 'package:cool_weather_flutter/screens/weather_forecast_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => WeatherCubit(WeatherRepository(WeatherApi())),
        child: WeatherForeCastScreen(),
      ),
    );
  }
}

import 'dart:developer';

import 'package:cool_weather_flutter/cubit/weather_cubit.dart';
import 'package:cool_weather_flutter/cubit/weather_state.dart';
import 'package:cool_weather_flutter/models/weather_forecast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WeatherForeCastScreen extends StatefulWidget {
  const WeatherForeCastScreen({super.key});

  @override
  State<WeatherForeCastScreen> createState() => _WeatherForeCastScreenState();
}

class _WeatherForeCastScreenState extends State<WeatherForeCastScreen> {
  // late Future<WeatherForecastResponse> forecastObject;

  // String _cityName = 'London';

  @override
  void initState() {
    // forecastObject = WeatherApi().getWeatherForecastWithCity(cityName: _cityName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _EnterFieldWidget(),
          SizedBox(height: 30),
          _ScreenContent(),
        ],
      ),
    );
  }
}

class _EnterFieldWidget extends StatefulWidget {
  @override
  State<_EnterFieldWidget> createState() => _EnterFieldWidgetState();
}

class _EnterFieldWidgetState extends State<_EnterFieldWidget> {
  final _nameCityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 250,
          padding: const EdgeInsets.only(top: 12, left: 12),
          child: TextFormField(
            onChanged: (text) {
              log(text);
              if (text.length >= 3) {
                context.read<WeatherCubit>().fetchWeather(text);
              }
            },
            controller: _nameCityController,
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.deepPurpleAccent,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: 'Enter the city name',
              hintText: 'Yes right here!',
              prefixIcon: const Icon(
                Icons.location_city_rounded,
                color: Colors.grey,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  _nameCityController.clear();
                },
                child: const Icon(
                  Icons.delete_outline,
                  color: Colors.deepOrange,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                borderSide: BorderSide(
                  color: Colors.lightGreenAccent,
                  width: 1.5,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                borderSide: BorderSide(color: Colors.purple, width: 1.5),
              ),
            ),
          ),
        ));
  }
}

class _ScreenContent extends StatelessWidget {
  const _ScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        switch (state.status) {
          case WeatherStatus.success:
            return WeatherPopulated(weather: state.weather);
          case WeatherStatus.initial:
            return const WeatherEmpty();
          case WeatherStatus.loading:
            return const WeatherLoading();
          case WeatherStatus.failure:
            return const WeatherFailure();
        }
      },
    );
  }
}

class WeatherEmpty extends StatelessWidget {
  const WeatherEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('oooo');
  }
}

class WeatherLoading extends StatelessWidget {
  const WeatherLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
        color: Colors.redAccent,
        size: 100,
      ),
    );
  }
}

class WeatherPopulated extends StatelessWidget {
  const WeatherPopulated({required this.weather, super.key});

  final WeatherForecast? weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        width: 230,
        height: 200,
        padding: const EdgeInsets.only(top: 30, left: 10),
        child: Column(
          children: [
            SizedBox(height: 20),
            NameCityWidget(cityName: weather?.city?.name ?? ''),
            // NameCityWidget(cityName:'Bishkek'),
            SizedBox(height: 10),
            TemperatureWidget(temperature: weather?.weatherList?[0].main?.temp ?? 0),
            // TemperatureWidget(temperature: 35),
            SizedBox(height: 10),
            _AdditionalInfoWidget(info: weather?.weatherList?[0].weather?[0].main ?? ''),
            // _AdditionalInfoWidget(info: 'rain'),
          ],
        ),
      ),
    );
  }
}

class NameCityWidget extends StatelessWidget {
  final String cityName;

  const NameCityWidget({
    super.key,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(width: 20),
        const Icon(
          Icons.location_city,
          size: 30,
          color: Colors.blueAccent,
        ),
        Text(cityName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontStyle: FontStyle.italic,
            )),
      ],
    );
  }
}

class TemperatureWidget extends StatelessWidget {
  final num temperature;

  const TemperatureWidget({
    required this.temperature,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        const Icon(
          Icons.thermostat,
          color: Colors.redAccent,
          size: 36,
        ),
        Text(
          '$temperature °C',
          style: const TextStyle(
            color: Colors.indigo,
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _AdditionalInfoWidget extends StatelessWidget {
  final String info;

  const _AdditionalInfoWidget({
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 30),
        const Icon(
          Icons.cloud,
          color: Colors.blue,
        ),
        const SizedBox(width: 10),
        Text(
          info,
          style: const TextStyle(
            color: Colors.teal,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}

class WeatherFailure extends StatelessWidget {
  const WeatherFailure({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🙈', style: TextStyle(fontSize: 64)),
        Text(
          'Something went wrong!',
          style: theme.textTheme.headlineSmall,
        ),
      ],
    );
  }
}

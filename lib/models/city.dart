import 'package:cool_weather_flutter/models/coord.dart';
import 'package:cool_weather_flutter/models_response/coord_response.dart';
import 'package:equatable/equatable.dart';

class City extends Equatable {
  final int? id;
  final String? name;
  final Coord? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  static const emptyCity = City(
    id: 0,
    name: '',
    coord: Coord(),
    country: '',
    population: 0,
    timezone: 0,
    sunrise: 0,
    sunset: 0,
  );

  const City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object?> get props => [id, name, coord, country, population, timezone, sunrise, sunset];
}

import 'package:cool_weather_flutter/models_response/coord_response.dart';
import 'package:equatable/equatable.dart';

class City extends Equatable {
  final int? id;
  final String? name;
  final CoordResponse? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  const City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  @override
  List<Object?> get props => [id, name, coord, country, population, timezone, sunrise, sunset];
}

import 'package:cool_weather_flutter/models_response/coord_response.dart';
import 'package:equatable/equatable.dart';

class CityResponse extends Equatable {
  final int? id;
  final String? name;
  final CoordResponse? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  const CityResponse({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  CityResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        coord = json['coord'] != null ? CoordResponse.fromJson(json['coord']) : null,
        country = json['country'],
        population = json['population'],
        timezone = json['timezone'],
        sunrise = json['sunrise'],
        sunset = json['sunset'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'coord': coord?.toJson(),
        'country': country,
        'population': population,
        'timezone': timezone,
        'sunrise': sunrise,
        'sunset': sunset,
      };

  @override
  List<Object?> get props => [id, name, coord, country, population, timezone, sunrise, sunset];
}

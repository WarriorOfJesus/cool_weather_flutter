import 'package:equatable/equatable.dart';

class MainWeatherDataResponse extends Equatable {
  const MainWeatherDataResponse({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  final num? temp;
  final num? feelsLike;
  final num? tempMin;
  final num? tempMax;
  final int? pressure;
  final int? seaLevel;
  final int? grndLevel;
  final int? humidity;
  final num? tempKf;

  MainWeatherDataResponse.fromJson(Map<String, dynamic> json)
      : temp = json['temp'],
        feelsLike = json['feels_like'],
        tempMin = json['temp_min'],
        tempMax = json['temp_max'],
        pressure = json['pressure'],
        seaLevel = json['sea_level'],
        grndLevel = json['grnd_level'],
        humidity = json['humidity'],
        tempKf = json['temp_kf'];

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'sea_level': seaLevel,
        'grnd_level': grndLevel,
        'humidity': humidity,
        'temp_kf': tempMax,
      };

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        seaLevel,
        grndLevel,
        humidity,
        tempKf,
      ];
}

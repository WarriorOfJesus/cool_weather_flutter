import 'package:equatable/equatable.dart';

class WeatherDataResponse extends Equatable {
  const WeatherDataResponse({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int? id;
  final String? main;
  final String? description;
  final String? icon;


  WeatherDataResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        main = json['main'],
        description = json['description'],
        icon = json['icon'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };

  @override
  List<Object?> get props => [id, main, description, icon];
}

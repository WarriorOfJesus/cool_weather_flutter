import 'package:equatable/equatable.dart';

class CoordResponse extends Equatable {
  final num? lat;
  final num? lon;

  const CoordResponse({this.lat, this.lon});

  CoordResponse.fromJson(Map<String, dynamic> json)
      : lat = json['lat'],
        lon = json['lon'];

  Map<String, dynamic> toJson() => {'lat': lat, 'lon': lon};

  @override
  List<Object?> get props => [lat, lon];
}

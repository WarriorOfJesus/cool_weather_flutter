import 'package:equatable/equatable.dart';

class Coord extends Equatable {
  final num? lat;
  final num? lon;

  const Coord({this.lat, this.lon});

  @override
  List<Object?> get props => [lat, lon];
}

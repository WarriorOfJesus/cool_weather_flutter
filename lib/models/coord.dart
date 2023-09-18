import 'package:equatable/equatable.dart';

class Coord extends Equatable {
  final int? lat;
  final int? lon;

  const Coord({this.lat, this.lon});

  @override
  List<Object?> get props => [lat, lon];
}

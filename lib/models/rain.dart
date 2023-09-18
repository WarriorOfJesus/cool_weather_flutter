import 'package:equatable/equatable.dart';

class Rain extends Equatable {

  final double? threeH;

  const Rain({this.threeH});

  @override
  List<Object?> get props => [threeH];
}

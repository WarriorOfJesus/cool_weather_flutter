import 'dart:convert';

import 'package:equatable/equatable.dart';

class RainResponse extends Equatable {

  final double? threeH;

  const RainResponse({this.threeH});

  RainResponse.fromJson(Map<String, dynamic> json) : threeH = json['3h'];

  Map<String, dynamic> toJson() => {'3h': threeH};

  @override
  List<Object?> get props => [threeH];
}

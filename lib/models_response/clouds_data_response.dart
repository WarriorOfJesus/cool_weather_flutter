import 'dart:core';

import 'package:equatable/equatable.dart';

class CloudsResponse extends Equatable {
  final int? all;

  const CloudsResponse({required this.all});

  CloudsResponse.fromJson(Map<String, dynamic> json) : all = json['all'];

  Map<String, dynamic> toJson() => {'all': all};

  @override
  List<Object?> get props => [all];
}

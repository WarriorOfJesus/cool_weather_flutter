import 'package:equatable/equatable.dart';

class SysResponse extends Equatable {
  final String? pod;

  const SysResponse({this.pod});

  SysResponse.fromJson(Map<String, dynamic> json) : pod = json['pod'];

  Map<String, dynamic> toJson() => {'pod': pod};

  @override
  List<Object?> get props => [pod];
}

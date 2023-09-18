import 'package:equatable/equatable.dart';

class Sys extends Equatable {
  final String? pod;

  const Sys({this.pod});

  @override
  List<Object?> get props => [pod];
}

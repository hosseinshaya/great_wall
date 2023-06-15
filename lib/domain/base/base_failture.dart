import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, required this.code});
  final int code;
  final String message;

  @override
  List<Object?> get props => [];
}

class BaseFailure extends Failure {
  const BaseFailure({required this.message, required this.code})
      : super(message: message, code: code);
  final int code;
  final String message;
}

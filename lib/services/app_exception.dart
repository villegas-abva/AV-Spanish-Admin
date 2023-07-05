import 'package:equatable/equatable.dart';

class AppException extends Equatable implements Exception {
  const AppException(this.message, this.source);

  @override
  List<Object?> get props => [message, source];

  final String message;
  final Object? source;

  factory AppException.fromObject(Object object) {
    return AppException('Unknown error', object);
  }
}

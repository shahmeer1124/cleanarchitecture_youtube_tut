import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  const ServerException({required this.message, required this.statusCode});
  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

class CacheException extends Equatable implements Exception {
  const CacheException({required this.statusCode, required this.message});
  final int statusCode;
  final String message;

  @override
  List<Object?> get props => [message, statusCode];
}

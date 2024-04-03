import 'package:equatable/equatable.dart';
import 'package:testproj/core/errors/exceptions.dart';

abstract class Failure extends Equatable {
  const Failure({required this.statusCode, required this.message});
  final int statusCode;
  final String message;

  @override
  List<Object?> get props => [statusCode, message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.statusCode, required super.message});
  ServerFailure.fromException(ServerException serverException)
      : this(
          message: serverException.message,
          statusCode: serverException.statusCode,
        );
}

class CacheFailure extends Failure {
  const CacheFailure({required super.statusCode, required super.message});
  CacheFailure.fromException(CacheException cacheException)
      : this(
          message: cacheException.message,
          statusCode: cacheException.statusCode,
        );
}

import 'package:dartz/dartz.dart';
import 'package:testproj/core/errors/exceptions.dart';
import 'package:testproj/core/errors/failures.dart';
import 'package:testproj/core/utils/typedef.dart';
import 'package:testproj/src/unbored/data/datasource/bore_remote_datasource.dart';
import 'package:testproj/src/unbored/domain/entities/bored.dart';
import 'package:testproj/src/unbored/domain/repos/bored_repo.dart';

class BoredRepoImpl implements BoredRepo {
  BoredRepoImpl({required this.remoteDataSource});
  BoredLocalDataSource remoteDataSource;
  @override
  ResultFuture<LocalBoredModel> getMessage() async {
    try {
      final result = await remoteDataSource.getMessage();
      return Right(result);
    } on ServerFailure catch (e) {
      print('thisis server failure');
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on ServerException catch (e) {
      print('thisis server failure');

      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}

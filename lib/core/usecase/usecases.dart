import 'package:testproj/core/utils/typedef.dart';

abstract class UseCaseWithOutParams<Type> {
  UseCaseWithOutParams();
  ResultFuture<Type> call();
}

abstract class UseCaseWithParams<Type, Params> {
  UseCaseWithParams();
  ResultFuture<Type> call(Params params);
}

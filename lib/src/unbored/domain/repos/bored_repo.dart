import 'package:testproj/core/utils/typedef.dart';

import 'package:testproj/src/unbored/domain/entities/bored.dart';

abstract class BoredRepo {
  BoredRepo();
  ResultFuture<LocalBoredModel> getMessage();
}

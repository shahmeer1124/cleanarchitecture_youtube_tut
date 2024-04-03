import 'package:testproj/core/usecase/usecases.dart';
import 'package:testproj/core/utils/typedef.dart';
import 'package:testproj/src/unbored/domain/entities/bored.dart';
import 'package:testproj/src/unbored/domain/repos/bored_repo.dart';

class GetInterestingMessageUseCase
    extends UseCaseWithOutParams<LocalBoredModel> {
  GetInterestingMessageUseCase(this._boredRepo);
  final BoredRepo _boredRepo;

  @override
  ResultFuture<LocalBoredModel> call() => _boredRepo.getMessage();
}

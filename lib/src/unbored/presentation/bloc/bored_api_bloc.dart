import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testproj/src/unbored/domain/entities/bored.dart';
import 'package:testproj/src/unbored/domain/usecases/get_interesting_message_usecase.dart';

part 'bored_api_event.dart';
part 'bored_api_state.dart';

class BoredApiBloc extends Bloc<BoredApiEvent, BoredApiState> {
  BoredApiBloc(
      {required GetInterestingMessageUseCase getInterestingMessageUseCase,})
      : _getInterestingMessageUseCase = getInterestingMessageUseCase,
        super(BoredApiInitial()) {
    on<GetMessageEvent>(_getMessageFromServer);
  }
  Future<void> _getMessageFromServer(
    GetMessageEvent event,
    Emitter<BoredApiState> emitter,
  ) async {
    emit(LoadingState(dateTime: DateTime.now()));
    final result = await _getInterestingMessageUseCase();
    result.fold(
        (failure) => emit(ErrorState(
            message: failure.message, statusCode: failure.statusCode,),),
        (data) => emit(MessageReceivedState(boredModel: data)),);
  }

  final GetInterestingMessageUseCase _getInterestingMessageUseCase;
}

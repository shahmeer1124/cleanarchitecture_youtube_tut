part of 'bored_api_bloc.dart';

sealed class BoredApiEvent extends Equatable {
  const BoredApiEvent();
}

class GetMessageEvent extends BoredApiEvent {
  @override
  List<Object?> get props => [];
}

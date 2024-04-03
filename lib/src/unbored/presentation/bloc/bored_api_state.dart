part of 'bored_api_bloc.dart';

sealed class BoredApiState extends Equatable {
  const BoredApiState();
}

final class BoredApiInitial extends BoredApiState {
  @override
  List<Object> get props => [];
}

class ErrorState extends BoredApiState {
  const ErrorState({required this.message, required this.statusCode});
  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

class MessageReceivedState extends BoredApiState {
  MessageReceivedState({required this.boredModel});
  LocalBoredModel boredModel;
  @override
  List<Object?> get props => [
        boredModel.accessibility,
        boredModel.key,
        boredModel.link,
        boredModel.participants,
        boredModel.type,
        boredModel.activity,
        boredModel.price,
      ];
}
class LoadingState extends BoredApiState{
  const LoadingState({required this.dateTime});
  final DateTime dateTime;
  @override

  List<Object?> get props => [dateTime];

}

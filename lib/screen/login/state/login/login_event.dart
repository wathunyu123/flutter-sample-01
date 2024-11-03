part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EventLoginInitial extends LoginEvent {}

class EventLoginRequest extends LoginEvent {
  final BuildContext context;
  final LoginRequestModel model;
  const EventLoginRequest({
    required this.context,
    required this.model,
  });

  @override
  List<Object> get props => [
        context,
        model,
      ];
}

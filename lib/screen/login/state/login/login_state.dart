part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class StateLoginInitial extends LoginState {}

final class StateLoginResponse extends LoginState {
  final LoginResponseModel model;
  const StateLoginResponse({
    required this.model,
  });

  @override
  List<Object> get props => [
        model,
      ];
}

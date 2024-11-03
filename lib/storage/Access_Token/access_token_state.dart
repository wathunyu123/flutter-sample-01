part of 'access_token_bloc.dart';

@override
class StateAccessToken extends Equatable {
  final String token;
  final String type;
  final String expire;
  final Permission permission;

  const StateAccessToken({
    required this.token,
    required this.type,
    required this.expire,
    required this.permission,
  });

  StateAccessToken copyWith({
    String? token,
    String? type,
    String? expire,
    Permission? permission,
  }) {
    return StateAccessToken(
      token: token ?? this.token,
      type: type ?? this.type,
      expire: expire ?? this.expire,
      permission: permission ?? this.permission,
    );
  }

  @override
  List<Object> get props => [
        token,
        type,
        expire,
        permission,
      ];
}

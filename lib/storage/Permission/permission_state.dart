part of 'permission_bloc.dart';

@override
class StatePermission extends Equatable {
  final Permission permission;

  const StatePermission({
    required this.permission,
  });

  StatePermission copyWith({
    Permission? permission,
  }) {
    return StatePermission(
      permission: permission ?? this.permission,
    );
  }

  @override
  List<Object> get props => [
        permission,
      ];
}

part of 'permission_bloc.dart';

@override
class EventPermission extends Equatable {
  final Permission permission;

  const EventPermission({
    required this.permission,
  });

  EventPermission copyWith({
    Permission? permission,
  }) {
    return EventPermission(
      permission: permission ?? this.permission,
    );
  }

  @override
  List<Object> get props => [
        permission,
      ];
}

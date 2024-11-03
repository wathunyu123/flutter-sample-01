part of 'department_bloc.dart';

@override
class EventDepartment extends Equatable {
  final int departmentId;

  const EventDepartment({
    required this.departmentId,
  });

  EventDepartment copyWith({
    int? departmentId,
  }) {
    return EventDepartment(
      departmentId: departmentId ?? this.departmentId,
    );
  }

  @override
  List<Object> get props => [
        departmentId,
      ];
}

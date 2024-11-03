part of 'department_bloc.dart';

@override
class StateDepartment extends Equatable {
  final String departmentName;

  const StateDepartment({
    required this.departmentName,
  });

  StateDepartment copyWith({
    String? departmentName,
  }) {
    return StateDepartment(
      departmentName: departmentName ?? this.departmentName,
    );
  }

  @override
  List<Object> get props => [
        departmentName,
      ];
}

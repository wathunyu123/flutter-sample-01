import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../network/api/department_api.dart';

part 'department_event.dart';
part 'department_state.dart';

class DepartmentBloc extends Bloc<EventDepartment, StateDepartment> {
  final APIDepartment apiDepartment;
  DepartmentBloc(this.apiDepartment)
      : super(
          const StateDepartment(
            departmentName: '',
          ),
        ) {
    on<EventDepartment>((event, emit) async {
      try {
        var data = {
          "departmentId": event.departmentId,
        };
        final response = await apiDepartment.getName(departmentId: data);
        String departmentName = '';
        switch (response.statusCode) {
          case 200:
            departmentName = response.data['data'];
            break;
          default:
            departmentName = '';
            break;
        }
        if (departmentName.isNotEmpty) {
          emit(
            StateDepartment(departmentName: departmentName),
          );
        }
      } catch (e) {
        if (kDebugMode) {
          debugPrint(e.toString());
        }
      }
    });
  }
}

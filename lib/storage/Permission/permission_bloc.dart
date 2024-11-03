import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../network/model/login/login_response.dart';

part 'permission_event.dart';
part 'permission_state.dart';

class PermissionBloc extends Bloc<EventPermission, StatePermission> {
  PermissionBloc()
      : super(
          StatePermission(
            permission: Permission(
              level: 0,
              department: 0,
            ),
          ),
        ) {
    on<EventPermission>((event, emit) {
      emit(
        state.copyWith(
          permission: event.permission,
        ),
      );
    });
  }
}

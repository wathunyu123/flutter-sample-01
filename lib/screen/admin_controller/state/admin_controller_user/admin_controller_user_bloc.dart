import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../network/api/admin_api.dart';
import '../../../../network/model/admin_controller_user/admin_controller_user_request.dart';
import '../../../../network/model/admin_controller_user/admin_controller_user_response.dart';
import '../../../../widget/dialog.dart';

part 'admin_controller_user_event.dart';
part 'admin_controller_user_state.dart';

class GetAdminControllerUserBloc
    extends Bloc<GetAdminControllerUserEvent, GetAdminControllerUserState> {
  final APIAdmin apiAdmin;
  GetAdminControllerUserBloc(this.apiAdmin)
      : super(StateGetAdminControllerUserInitial()) {
    on<EventAdminControllerUserInitial>((event, emit) {
      emit(StateGetAdminControllerUserInitial());
    });
    on<EventAdminControllerUserFetching>((event, emit) async {
      final dialog = AdaptiveDialog.instance;
      try {
        var data = GetAdminControllerUserRequestModel(
          departmentId: event.departmentId,
        ).toJson();
        final response = await apiAdmin.allUser(data: data);
        switch (response.statusCode) {
          case 200:
            if (response.data['data'] != null) {
              final model = (response.data['data'] as List)
                  .map(
                    (e) => GetAdminControllerUserResponseModel.fromJson(e),
                  )
                  .toList();
              if (model.isNotEmpty) {
                emit(
                  StateAdminControllerUserFetchSuccess(
                    model: model,
                  ),
                );
              }
            }
            break;
          default:
            break;
        }
      } on DioException catch (e) {
        emit(StateGetAdminControllerUserFetchError());
        final message = e.response?.data['message'] ?? 'เซิฟเวอร์ขัดข้อง';
        // ignore: use_build_context_synchronously
        dialog.show(
          context: event.context,
          accept: 'ตกลง',
          title: 'แจ้งเตือน',
          description: message,
        );
        if (kDebugMode) {
          debugPrint(e.toString());
        }
      } catch (e) {
        emit(StateGetAdminControllerUserFetchError());
        if (kDebugMode) {
          debugPrint(e.toString());
        }
      }
    });
  }
}

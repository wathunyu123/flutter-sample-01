import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../network/api/admin_api.dart';
import '../../../../network/model/admin_controller_department/admin_controller_department_request.dart';
import '../../../../network/model/admin_controller_department/admin_controller_department_response.dart';
import '../../../../widget/dialog.dart';

part 'admin_controller_department_event.dart';
part 'admin_controller_department_state.dart';

class GetAdminControllerDepartmentBloc extends Bloc<
    GetAdminControllerDepartmentEvent, GetAdminControllerDepartmentState> {
  final APIAdmin apiAdmin;
  GetAdminControllerDepartmentBloc(this.apiAdmin)
      : super(StateGetAdminControllerDepartmentInitial()) {
    on<EventAdminControllerDepartmentInitial>((event, emit) {
      emit(StateGetAdminControllerDepartmentInitial());
    });
    on<EventAdminControllerDepartmentFetching>((event, emit) async {
      final dialog = AdaptiveDialog.instance;
      try {
        var data = GetAdminControllerDepartmentRequestModel(
          level: event.level,
        ).toJson();
        final response = await apiAdmin.allDepartment(data: data);
        switch (response.statusCode) {
          case 200:
            if (response.data['data'] != null) {
              final model = (response.data['data'] as List)
                  .map(
                    (e) =>
                        GetAdminControllerDepartmentResponseModel.fromJson(e),
                  )
                  .toList();
              if (model.isNotEmpty) {
                emit(
                  StateAdminControllerDepartmentFetchSuccess(
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
        emit(StateGetAdminControllerDepartmentFetchError());
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
        emit(StateGetAdminControllerDepartmentFetchError());
        if (kDebugMode) {
          debugPrint(e.toString());
        }
      }
    });
  }
}

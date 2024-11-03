import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../network/api/overview_api.dart';
import '../../../../network/model/get_overview_data_department/get_overview_data_department_request.dart';
import '../../../../widget/dialog.dart';

part 'overview_data_department_event.dart';
part 'overview_data_department_state.dart';

class GetOverviewDataDepartmentBloc extends Bloc<GetOverviewDataDepartmentEvent,
    GetOverviewDataDepartmentState> {
  final APIOverviewData apiOverviewData;
  GetOverviewDataDepartmentBloc(this.apiOverviewData)
      : super(StateGetOverviewDataDepartmentInitial()) {
    on<EventOverviewDataDepartmentInitial>((event, emit) {
      emit(StateGetOverviewDataDepartmentInitial());
    });
    on<EventOverviewDataDepartmentFetching>((event, emit) async {
      final dialog = AdaptiveDialog.instance;
      try {
        var data = GetOverviewDataDepartmentRequestModel(
          departmentId: event.departmentId,
        ).toJson();
        final response = await apiOverviewData.countDepartment(data: data);
        switch (response.statusCode) {
          case 200:
            if (response.data['data'] != null) {
              final countDepartment = (response.data['data'] as int);
              if (countDepartment > -1) {
                emit(
                  StateOverviewDataDepartmentFetchSuccess(
                    countDepartment: countDepartment,
                  ),
                );
              }
            }
            break;
          default:
            break;
        }
      } on DioException catch (e) {
        emit(StateGetOverviewDataDepartmentFetchError());
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
        emit(StateGetOverviewDataDepartmentFetchError());
        if (kDebugMode) {
          debugPrint(e.toString());
        }
      }
    });
  }
}

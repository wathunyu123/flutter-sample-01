import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../network/api/overview_api.dart';
import '../../../../network/model/get_overview_data_user/get_overview_data_user_request.dart';
import '../../../../widget/dialog.dart';

part 'overview_data_user_event.dart';
part 'overview_data_user_state.dart';

class GetOverviewDataUserBloc
    extends Bloc<GetOverviewDataUserEvent, GetOverviewDataUserState> {
  final APIOverviewData apiOverviewData;
  GetOverviewDataUserBloc(this.apiOverviewData)
      : super(StateGetOverviewDataUserInitial()) {
    on<EventOverviewDataUserInitial>((event, emit) {
      emit(StateGetOverviewDataUserInitial());
    });
    on<EventOverviewDataUserFetching>((event, emit) async {
      final dialog = AdaptiveDialog.instance;
      try {
        var data = GetOverviewDataUserRequestModel(
          userId: event.userId,
        ).toJson();
        final response = await apiOverviewData.countUser(data: data);
        switch (response.statusCode) {
          case 200:
            if (response.data['data'] != null) {
              final countUser = (response.data['data'] as int);
              if (countUser > -1) {
                emit(
                  StateOverviewDataUserFetchSuccess(
                    countUser: countUser,
                  ),
                );
              }
            }
            break;
          default:
            break;
        }
      } on DioException catch (e) {
        emit(StateGetOverviewDataUserFetchError());
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
        emit(StateGetOverviewDataUserFetchError());
        if (kDebugMode) {
          debugPrint(e.toString());
        }
      }
    });
  }
}

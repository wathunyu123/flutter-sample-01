import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../network/api/input_body_info.dart';
import '../../../../network/model/get_body_info/get_body_info_request.dart';
import '../../../../network/model/get_body_info/get_body_info_response.dart';
import '../../../../widget/dialog.dart';

part 'get_body_info_event.dart';
part 'get_body_info_state.dart';

class GetBodyInfoBloc extends Bloc<GetBodyInfoEvent, GetBodyInfoState> {
  final APIBodyInfo apiBodyInfo;
  GetBodyInfoBloc(this.apiBodyInfo) : super(StateGetBodyInfoInitial()) {
    on<EventGetBodyInfoInitial>((event, emit) {
      emit(StateGetBodyInfoInitial());
    });
    on<EventGetBodyInfoAllFetching>((event, emit) async {
      final dialog = AdaptiveDialog.instance;
      try {
        var data = GetBodyInfoRequestModel(
          userId: event.userId,
        ).toJson();
        final response = await apiBodyInfo.get(data: data);
        switch (response.statusCode) {
          case 200:
            if (response.data['data'].isNotEmpty) {
              final bodyInfoModelList = (response.data['data'] as List)
                  .map(
                    (e) => GetBodyInfoResponseModel.fromJson(e),
                  )
                  .toList();

              if (bodyInfoModelList.isNotEmpty) {
                emit(
                  StateGetBodyInfoAllFetchSuccess(
                    model: bodyInfoModelList,
                  ),
                );
              }
            }
            break;
          default:
            break;
        }
      } on DioException catch (e) {
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
        if (kDebugMode) {
          debugPrint(e.toString());
        }
      }
    });
  }
}

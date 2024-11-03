import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../network/api/input_body_info.dart';
import '../../../../network/model/get_level_recommend_info/get_level_recommend_info_request.dart';
import '../../../../network/model/get_level_recommend_info/get_level_recommend_info_response.dart';
// import '../../../../widget/dialog.dart';

part 'get_level_recommend_info_event.dart';
part 'get_level_recommend_info_state.dart';

class GetLevelRecommendInfoBloc
    extends Bloc<GetLevelRecommendInfoEvent, GetLevelRecommendInfoState> {
  final APIBodyInfo apiBodyInfo;
  GetLevelRecommendInfoBloc(this.apiBodyInfo)
      : super(StateGetLevelRecommendInfoInitial()) {
    on<EventGetLevelRecommendInfoInitial>((event, emit) {
      emit(StateGetLevelRecommendInfoInitial());
    });
    on<EventGetLevelRecommendInfoFetching>((event, emit) async {
      // final dialog = AdaptiveDialog.instance;
      try {
        var data = GetLevelRecommendInfoRequestModel(
          month: event.model.month,
          levelHeightAge: event.model.levelHeightAge,
          levelHeightWeight: event.model.levelHeightWeight,
        ).toJson();
        final response = await apiBodyInfo.recommendLevel(data: data);
        switch (response.statusCode) {
          case 200:
            if (response.data['data'].isNotEmpty) {
              final recommendInfoModelList = (response.data['data'] as List)
                  .map(
                    (e) => GetLevelRecommendInfoResponseModel.fromJson(e),
                  )
                  .toList();

              if (recommendInfoModelList.isNotEmpty) {
                emit(
                  StateGetLevelRecommendInfoFetchSuccess(
                    model: recommendInfoModelList.first,
                  ),
                );
              } else {
                emit(
                  StateGetLevelRecommendInfoFetchError(
                    message: response.data['message'],
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
        emit(
          StateGetLevelRecommendInfoFetchError(
            message: message,
          ),
        );
        // ignore: use_build_context_synchronously
        // dialog.show(
        //   context: event.context,
        //   accept: 'ตกลง',
        //   title: 'แจ้งเตือน',
        //   description: message,
        // );
        if (kDebugMode) {
          debugPrint(e.toString());
        }
      } catch (e) {
        emit(
          StateGetLevelRecommendInfoFetchError(
            message: e.toString(),
          ),
        );
        if (kDebugMode) {
          debugPrint(e.toString());
        }
      }
    });
  }
}

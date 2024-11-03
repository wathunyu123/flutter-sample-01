import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../network/api/input_body_info.dart';
import '../../../../network/model/get_recommend_info/get_recommend_info_request.dart';
import '../../../../network/model/get_recommend_info/get_recommend_info_response.dart';
// import '../../../../widget/dialog.dart';

part 'get_recommend_info_event.dart';
part 'get_recommend_info_state.dart';

class GetRecommendInfoBloc
    extends Bloc<GetRecommendInfoEvent, GetRecommendInfoState> {
  final APIBodyInfo apiBodyInfo;
  GetRecommendInfoBloc(this.apiBodyInfo)
      : super(StateGetRecommendInfoInitial()) {
    on<EventGetRecommendInfoInitial>((event, emit) {
      emit(StateGetRecommendInfoInitial());
    });
    on<EventGetRecommendInfoFetching>((event, emit) async {
      // final dialog = AdaptiveDialog.instance;
      try {
        var data = GetRecommendInfoRequestModel(
          month: event.model.month,
        ).toJson();
        final response = await apiBodyInfo.recommend(data: data);
        switch (response.statusCode) {
          case 200:
            if (response.data['data'].isNotEmpty) {
              final recommendInfoModelList = (response.data['data'] as List)
                  .map(
                    (e) => GetRecommendInfoResponseModel.fromJson(e),
                  )
                  .toList();

              if (recommendInfoModelList.isNotEmpty) {
                emit(
                  StateGetRecommendInfoFetchSuccess(
                    model: recommendInfoModelList.first,
                  ),
                );
              } else {
                emit(
                  StateGetRecommendInfoFetchError(
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
          StateGetRecommendInfoFetchError(
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
          StateGetRecommendInfoFetchError(
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

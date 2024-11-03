import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../network/model/calculate_body_info/calculate_body_info_request.dart';
import '../../../../helper/calculate.dart';
import '../../../../helper/time.dart';
import '../../../../model/calculate_body_info.dart';
import '../../../../network/api/input_body_info.dart';
import '../../../../network/model/calculate_body_info/height_by_age_response.dart';
import '../../../../network/model/calculate_body_info/height_by_weight_response.dart';
import '../../../../network/model/calculate_body_info/recommend_response.dart';
import '../../../../network/model/calculate_body_info/weight_by_age_response.dart';
import '../../../../network/model/get_body_info/get_body_info_response.dart';

part 'calculate_body_info_event.dart';
part 'calculate_body_info_state.dart';

class CalculateBodyInfoBloc
    extends Bloc<EventCalculateBodyInfo, StateCalculateBodyInfo> {
  final APIBodyInfo apiBodyInfo;
  CalculateBodyInfoBloc(this.apiBodyInfo)
      : super(StateCalculateBodyInfoInitial()) {
    on<EventCalculateBodyInfoInitial>((event, emit) async {
      emit(StateCalculateBodyInfoInitial());
    });
    on<EventCalculateBodyInfoFetching>((event, emit) async {
      String nickName = event.model.nickname;
      String address = event.model.address;
      String phone = event.model.phone;

      List<int> ageCurrent = CalculateX.instance.age(
        birthday: event.model.birth,
      );
      int yearY = ageCurrent[0];
      int yearM = ageCurrent[1];
      List<int> ageDate = CalculateX.instance.age(
        birthday: event.model.birth,
        selectDate: event.model.date,
      );
      int selectY = ageDate[0];
      int selectM = ageDate[1];

      String aging = '$yearY ปี $yearM เดือน';
      String aged = '$selectY ปี $selectM เดือน';

      int agingMonth = (yearY * 12) + yearM;
      int agedMonth = (selectY * 12) + selectM;

      String gender = event.model.gender;
      String birthDay = DateTimeX.instance.formatThai(
        birthday: event.model.birth,
      );
      String date = DateTimeX.instance.formatThai(
        birthday: event.model.date,
      );
      double doubleHeight = double.parse(
        event.model.height,
      );
      double doubleWeight = double.parse(
        event.model.weight,
      );
      String height = '${doubleHeight.toStringAsFixed(2)} เซนติเมตร';
      String weight = '${doubleWeight.toStringAsFixed(2)} กิโลกรัม';

      String ibw = 'กิโลกรัม';
      String weightAs = '% ของ IBW';

      String ha = 'เซนติเมตร';
      String heightAs = '% Median HA';

      // Start Server Calculating
      late WeightByAgeResponseModel weightByAgeResponseModel;
      late HeightByAgeResponseModel heightByAgeResponseModel;
      late HeightByWeightResponseModel heightByWeightResponseModel;
      late CalculateRecommendResponseModel calculateRecommendResponseModel;
      try {
        var send = CalculateBodyInfoRequestModel(
          id: event.model.id,
          nickname: event.model.nickname,
          birth: event.model.birth,
          gender: event.model.gender,
          date: event.model.date,
          height: event.model.height,
          weight: event.model.weight,
          creator: event.model.creator,
        ).toJson();
        final resWeightByAge = await apiBodyInfo.weightByAge(data: send);
        if (resWeightByAge.data['data'].isNotEmpty) {
          weightByAgeResponseModel = WeightByAgeResponseModel.fromJson(
            resWeightByAge.data['data'],
          );
        } else {
          weightByAgeResponseModel = WeightByAgeResponseModel(
            medianWt: .0,
            sdWtM: .0,
            sd2WtM: .0,
            sd15WtM: .0,
            sd15Wt: .0,
            sd2Wt: .0,
            weightByAge: WeightByAge(
              level: 0,
              describe: '',
            ),
          );
        }
        final resHeightByAge = await apiBodyInfo.heightByAge(data: send);
        if (resHeightByAge.data['data'].isNotEmpty) {
          heightByAgeResponseModel = HeightByAgeResponseModel.fromJson(
            resHeightByAge.data['data'],
          );
        } else {
          heightByAgeResponseModel = HeightByAgeResponseModel(
            medianHt: .0,
            sdHt: .0,
            sd2Ht: .0,
            sd15Ht: .0,
            sd15HtM: .0,
            sd2HtM: .0,
            heightByAge: HeightByAge(
              level: 0,
              describe: '',
            ),
          );
        }
        final resHeightByWeight = await apiBodyInfo.heightByWeight(data: send);
        if (resHeightByWeight.data['data'].isNotEmpty) {
          heightByWeightResponseModel = HeightByWeightResponseModel.fromJson(
            resHeightByWeight.data['data'],
          );
        } else {
          heightByWeightResponseModel = HeightByWeightResponseModel(
            medianHt: .0,
            sd: .0,
            sd2: .0,
            sd15: .0,
            sd15M: .0,
            sd2M: .0,
            sd3: .0,
            heightByWeight: HeightByWeight(
              level: 0,
              describe: '',
            ),
          );
        }
        final resRecommend = await apiBodyInfo.calculateRecommend(data: send);
        if (resRecommend.data['data'].isNotEmpty) {
          calculateRecommendResponseModel =
              CalculateRecommendResponseModel.fromJson(
            resRecommend.data['data'],
          );
          double ibwCal = calculateRecommendResponseModel.ibw;
          double haCal = calculateRecommendResponseModel.ha;
          ibw = '${ibwCal.toStringAsFixed(2)} กิโลกรัม';
          ha = '${haCal.toStringAsFixed(2)} เซนติเมตร';
          double weightPercentage = double.tryParse(
                calculateRecommendResponseModel.weightPercentage.toString(),
              ) ??
              .0;
          weightAs = '${weightPercentage.toStringAsFixed(2)} % ของ IBW';
          double heightPercentage = double.tryParse(
                calculateRecommendResponseModel.heightPercentage.toString(),
              ) ??
              .0;
          heightAs = '${heightPercentage.toStringAsFixed(2)} % median HA';
        } else {
          calculateRecommendResponseModel = CalculateRecommendResponseModel(
            ibw: .0,
            ha: .0,
            weightPercentage: .0,
            heightPercentage: .0,
          );
        }
      } on DioException catch (e) {
        if (kDebugMode) {
          debugPrint(e.toString());
        }
      } catch (e) {
        if (kDebugMode) {
          debugPrint(e.toString());
        }
      }
      // End Server Calculating

      final calculateModel = CalculateBodyInfoModel(
        nickName: nickName,
        address: address,
        phone: phone,
        ageCurrent: aging,
        ageDate: aged,
        ageCurrentMonth: agingMonth,
        ageDateMonth: agedMonth,
        gender: gender,
        birth: birthDay,
        height: height,
        weight: weight,
        date: date,
        ibw: ibw,
        weightAs: weightAs,
        ha: ha,
        heightAs: heightAs,
      );

      emit(
        StateCalculateBodyInfoFetchSuccess(
          model: calculateModel,
          weightByAge: weightByAgeResponseModel,
          heightByAge: heightByAgeResponseModel,
          heightByWeight: heightByWeightResponseModel,
          calculateRecommend: calculateRecommendResponseModel,
        ),
      );
    });
  }
}

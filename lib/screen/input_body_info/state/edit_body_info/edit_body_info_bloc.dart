import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../helper/calculate.dart';
import '../../../../helper/time.dart';
import '../../../../network/api/input_body_info.dart';
import '../../../../network/model/check_body_info/check_body_info_request.dart';
import '../../../../network/model/edit_body_info/edit_body_info_request.dart';
import '../../../../network/model/get_body_info/get_body_info_response.dart';
import '../../../../widget/dialog.dart';
import '../../../nutrition_assessment/state/get_body_info/get_body_info_bloc.dart';
import '../../../nutrition_assessment/state/select_body_info/select_body_info_bloc.dart';

part 'edit_body_info_event.dart';
part 'edit_body_info_state.dart';

class EditBodyInfoBloc extends Bloc<EditBodyInfoEvent, EditBodyInfoState> {
  final APIBodyInfo apiBodyInfo;
  EditBodyInfoBloc(this.apiBodyInfo) : super(StateEditBodyInfoInitial()) {
    on<EventEditBodyInfoInitial>((event, emit) {
      emit(StateEditBodyInfoInitial());
    });
    on<EventEditBodyInfoFetching>((event, emit) async {
      final dialog = AdaptiveDialog.instance;
      final calculateX = CalculateX.instance;
      final id = event.model.id;
      final nickname = event.model.nickname;
      final address = event.model.address;
      final phone = event.model.phone;
      final birth = event.model.birth;
      final gender = event.model.gender;
      final date = event.model.date;
      final height = event.model.height;
      final weight = event.model.weight;
      final creator = event.model.creator;
      final result1 = event.model.result1;
      final result2 = event.model.result2;
      final result3 = event.model.result3;
      final department = event.model.department;
      final isCheckBirth = !(birth.contains('วัน') ||
          birth.contains('เดือน') ||
          birth.contains('00') ||
          birth.contains('ปี'));
      final isCheckDate = !(date.contains('วัน') ||
          date.contains('เดือน') ||
          date.contains('00') ||
          date.contains('ปี'));
      final condition = nickname.isNotEmpty &&
          address.isNotEmpty &&
          birth.isNotEmpty &&
          gender.isNotEmpty &&
          date.isNotEmpty &&
          height.isNotEmpty &&
          weight.isNotEmpty &&
          creator.isNotEmpty &&
          isCheckBirth &&
          isCheckDate;

      if (condition) {
        final isBefore = DateTimeX.instance.isDateBeforeSelectedDate(
          date: birth,
          selectedDate: date,
        );
        if (isBefore) {
          List<int> ageCurrent = calculateX.age(birthday: birth);
          int yearY = ageCurrent[0];
          int yearM = ageCurrent[1];
          List<int> ageDate = calculateX.age(birthday: birth, selectDate: date);
          int selectY = ageDate[0];
          int selectM = ageDate[1];
          String alertMessage =
              'ชื่อเล่น: $nickname\nที่อยู่: $address\nเบอร์โทร: $phone\nเพศ: $gender\nวันเกิด: $birth\nวันที่ชั่งวัด: $date\nอายุ ณ วันวัดชั่ง: $selectY ปี $selectM เดือน\nอายุปัจจุบัน: $yearY ปี $yearM เดือน\nส่วนสูง: ${double.parse(height).toStringAsFixed(2)} ซม.\nน้ำหนัก: ${double.parse(weight).toStringAsFixed(2)} กก.';
          dialog.show(
            context: event.context,
            accept: 'ตกลง',
            cancel: 'ย้อนกลับ',
            title: 'ตรวจสอบข้อมูล',
            description: alertMessage,
            callback: () async {
              try {
                var check = CheckBodyInfoRequestModel(
                  id: id,
                ).toJson();
                final res = await apiBodyInfo.check(data: check);
                if (res.data.isNotEmpty) {
                  // ignore: use_build_context_synchronously
                  event.context.pop();
                  var data = EditBodyInfoRequestModel(
                    id: id,
                    nickname: nickname,
                    address: address,
                    phone: phone,
                    birth: birth,
                    gender: gender,
                    date: date,
                    height: height,
                    weight: weight,
                    creator: creator,
                    result1: result1,
                    result2: result2,
                    result3: result3,
                    department: department,
                  ).toJson();
                  final response = await apiBodyInfo.edit(data: data);
                  switch (response.statusCode) {
                    case 200:
                      if (response.data['message'].isNotEmpty) {
                        final message = response.data['message'];
                        if (message.isNotEmpty) {
                          // ignore: use_build_context_synchronously
                          event.context.read<GetBodyInfoBloc>().add(
                                // ignore: use_build_context_synchronously
                                EventGetBodyInfoAllFetching(
                                  context: event.context,
                                  userId: creator,
                                ),
                              );
                          // ignore: use_build_context_synchronously
                          event.context.read<SelectBodyInfoBloc>().add(
                                EventSelectBodyInfo(
                                  model: GetBodyInfoResponseModel(
                                    id: id,
                                    nickname: nickname,
                                    address: address,
                                    phone: phone,
                                    birth: birth,
                                    gender: gender,
                                    date: date,
                                    height: height,
                                    weight: weight,
                                    creator: creator,
                                    result1: result1,
                                    result2: result2,
                                    result3: result3,
                                    department: department,
                                    createdAt: '',
                                    updatedAt: '',
                                  ),
                                ),
                              );
                          // ignore: use_build_context_synchronously
                          event.context.pop();
                          // ignore: use_build_context_synchronously
                          event.context.pop();
                          // ignore: use_build_context_synchronously
                          dialog.show(
                            context: event.context,
                            accept: 'ตกลง',
                            title: 'แจ้งเตือน',
                            description: message,
                          );
                        }
                      }
                      break;
                    default:
                      break;
                  }
                } else {
                  // ignore: use_build_context_synchronously
                  event.context.pop();
                  const message = 'แก้ไขข้อมูลไม่ถูกต้อง';
                  // ignore: use_build_context_synchronously
                  dialog.show(
                    context: event.context,
                    accept: 'ตกลง',
                    title: 'แจ้งเตือน',
                    description: message,
                  );
                }
              } on DioException catch (e) {
                final message =
                    e.response?.data['message'] ?? 'เซิฟเวอร์ขัดข้อง';
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
            },
          );
        } else {
          String message = 'กรุณาเลือกวันเที่ชั่งวัดหลังวันเกิด';
          dialog.show(
            context: event.context,
            accept: 'ตกลง',
            title: 'ข้อมูลไม่ถูกต้อง',
            description: message,
          );
        }
      } else {
        if (creator.isNotEmpty) {
          String message = 'กรุณากรอกข้อมูล';
          if (nickname.isEmpty) {
            message = '$message ชื่อเล่น';
          }
          if (birth.isEmpty || !isCheckBirth) {
            message = '$message วันเกิด';
          }
          if (gender.isEmpty) {
            message = '$message เพศ';
          }
          if (date.isEmpty || !isCheckDate) {
            message = '$message วันที่ชั่งวัด';
          }
          if (height.isEmpty) {
            message = '$message ส่วนสูง';
          }
          if (weight.isEmpty) {
            message = '$message น้ำหนัก';
          }
          message = '$message ให้ครบถ้วน';
          dialog.show(
            context: event.context,
            accept: 'ตกลง',
            title: 'แจ้งเตือน',
            description: message,
          );
        } else {
          String message = 'กรุณาเข้าสู่ระบบใหม่อีกครั้ง';
          dialog.show(
            context: event.context,
            accept: 'ตกลง',
            title: 'แจ้งเตือน',
            description: message,
          );
        }
      }
    });
  }
}

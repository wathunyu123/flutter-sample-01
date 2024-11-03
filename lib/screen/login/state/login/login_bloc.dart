import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../network/api/login.dart';
import '../../../../network/model/login/login_request.dart';
import '../../../../network/model/login/login_response.dart';
import '../../../../router/define.dart';
import '../../../../storage/Access_Token/access_token_bloc.dart';
import '../../../../storage/Creator/creator_bloc.dart';
import '../../../../storage/Department/department_bloc.dart';
import '../../../../storage/Permission/permission_bloc.dart';
import '../../../../widget/dialog.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final APILogin apiLogin;
  LoginBloc(this.apiLogin) : super(StateLoginInitial()) {
    on<EventLoginInitial>((event, emit) async {
      emit(StateLoginInitial());
    });
    on<EventLoginRequest>((event, emit) async {
      try {
        var data = LoginRequestModel(
          identityNumber: event.model.identityNumber,
          password: event.model.password,
        ).toJson();
        final response = await apiLogin.login(data: data);
        switch (response.statusCode) {
          case 200:
            final loginModel = LoginResponseModel.fromJson(response.data);
            if (loginModel.accessToken.isNotEmpty) {
              final token = loginModel.accessToken;
              final type = loginModel.tokenType;
              final expire = loginModel.expiresIn;
              final permission = loginModel.permission;
              // ignore: use_build_context_synchronously
              event.context.read<CreatorBloc>().add(
                    EventCreator(
                      by: event.model.identityNumber,
                    ),
                  );
              // ignore: use_build_context_synchronously
              event.context.read<AccessTokenBloc>().add(
                    EventAccessToken(
                      token: token,
                      type: type,
                      expire: expire,
                      permission: permission,
                    ),
                  );
              // ignore: use_build_context_synchronously
              event.context.read<PermissionBloc>().add(
                    EventPermission(
                      permission: permission,
                    ),
                  );
              // ignore: use_build_context_synchronously
              event.context.read<DepartmentBloc>().add(
                    EventDepartment(
                      departmentId: permission.department,
                    ),
                  );
              // ignore: use_build_context_synchronously
              event.context.pushReplacement(
                RouterName.home.toPath,
              );
            }
            break;
          default:
            break;
        }
      } on DioException catch (e) {
        final message = e.response?.data['message'] ?? 'เซิฟเวอร์ขัดข้อง';
        final dialog = AdaptiveDialog.instance;
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

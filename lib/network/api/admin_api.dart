import 'package:dio/dio.dart';

import '../option.dart';
import '../service.dart';
import '../url.dart';
import '../../storage/Access_Token/access_token_bloc.dart';

class APIAdmin {
  final ApiService apiService = ApiService();
  final AccessTokenBloc accessTokenBloc;

  APIAdmin({
    required this.accessTokenBloc,
  });

  Future<Response> allUser({
    required Map<String, dynamic> data,
  }) async {
    var options = accessTokenBloc.state;
    try {
      final Response response = await apiService.post(
        options: NetworkOption.instance.authority(
          options: options,
        ),
        AppUrl.allUser,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> allDepartment({
    required Map<String, dynamic> data,
  }) async {
    var options = accessTokenBloc.state;
    try {
      final Response response = await apiService.post(
        options: NetworkOption.instance.authority(
          options: options,
        ),
        AppUrl.allDepartment,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

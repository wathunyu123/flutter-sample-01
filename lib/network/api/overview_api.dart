import 'package:dio/dio.dart';

import '../option.dart';
import '../service.dart';
import '../url.dart';
import '../../storage/Access_Token/access_token_bloc.dart';

class APIOverviewData {
  final ApiService apiService = ApiService();
  final AccessTokenBloc accessTokenBloc;

  APIOverviewData({
    required this.accessTokenBloc,
  });

  Future<Response> countUser({
    required Map<String, dynamic> data,
  }) async {
    var options = accessTokenBloc.state;
    try {
      final Response response = await apiService.post(
        options: NetworkOption.instance.authority(
          options: options,
        ),
        AppUrl.countUser,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> countDepartment({
    required Map<String, dynamic> data,
  }) async {
    var options = accessTokenBloc.state;
    try {
      final Response response = await apiService.post(
        options: NetworkOption.instance.authority(
          options: options,
        ),
        AppUrl.countDepartment,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

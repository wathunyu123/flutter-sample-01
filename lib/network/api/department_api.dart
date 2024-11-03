import 'package:dio/dio.dart';

import '../option.dart';
import '../service.dart';
import '../url.dart';
import '../../storage/Access_Token/access_token_bloc.dart';

class APIDepartment {
  final ApiService apiService = ApiService();
  final AccessTokenBloc accessTokenBloc;

  APIDepartment({
    required this.accessTokenBloc,
  });

  Future<Response> getName({
    required Map<String, int> departmentId,
  }) async {
    var options = accessTokenBloc.state;
    try {
      final Response response = await apiService.post(
        options: NetworkOption.instance.authority(
          options: options,
        ),
        AppUrl.departmentName,
        data: departmentId,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

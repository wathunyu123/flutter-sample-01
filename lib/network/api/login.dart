import 'package:dio/dio.dart';

import '../url.dart';
import '../service.dart';

class APILogin {
  final ApiService apiService = ApiService();

  Future<Response> login({
    required Map<String, dynamic> data,
  }) async {
    try {
      final Response response = await apiService.post(
        AppUrl.login,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

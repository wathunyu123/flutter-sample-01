import 'package:dio/dio.dart';

import '../url.dart';
import '../option.dart';
import '../service.dart';
import '../../storage/Access_Token/access_token_bloc.dart';

class APIBodyInfo {
  final ApiService apiService = ApiService();
  final AccessTokenBloc accessTokenBloc;

  APIBodyInfo({
    required this.accessTokenBloc,
  });

  Future<Response> add({
    required Map<String, dynamic> data,
  }) async {
    var options = accessTokenBloc.state;
    try {
      final Response response = await apiService.post(
        options: NetworkOption.instance.authority(
          options: options,
        ),
        AppUrl.addInputInfo,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> edit({
    required Map<String, dynamic> data,
  }) async {
    var options = accessTokenBloc.state;
    try {
      final Response response = await apiService.post(
        options: NetworkOption.instance.authority(
          options: options,
        ),
        AppUrl.editInputInfo,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete({
    required Map<String, dynamic> data,
  }) async {
    var options = accessTokenBloc.state;
    try {
      final Response response = await apiService.post(
        options: NetworkOption.instance.authority(
          options: options,
        ),
        AppUrl.deleteInputInfo,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> get({
    required Map<String, dynamic> data,
  }) async {
    var options = accessTokenBloc.state;
    try {
      final Response response = await apiService.post(
        options: NetworkOption.instance.authority(
          options: options,
        ),
        AppUrl.getInputInfoAll,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> check({
    required Map<String, dynamic> data,
  }) async {
    var options = accessTokenBloc.state;
    try {
      final Response response = await apiService.post(
        options: NetworkOption.instance.authority(
          options: options,
        ),
        AppUrl.getInputInfoId,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> recommend({
    required Map<String, dynamic> data,
  }) async {
    var options = accessTokenBloc.state;
    try {
      final Response response = await apiService.post(
        options: NetworkOption.instance.authority(
          options: options,
        ),
        AppUrl.getRecommendInfo,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> recommendLevel({
    required Map<String, dynamic> data,
  }) async {
    var options = accessTokenBloc.state;
    try {
      final Response response = await apiService.post(
        options: NetworkOption.instance.authority(
          options: options,
        ),
        AppUrl.getLevelRecommendInfo,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> weightByAge({
    required Map<String, dynamic> data,
  }) async {
    var options = accessTokenBloc.state;
    try {
      final Response response = await apiService.post(
        options: NetworkOption.instance.authority(
          options: options,
        ),
        AppUrl.calculateWeightByAge,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> heightByAge({
    required Map<String, dynamic> data,
  }) async {
    var options = accessTokenBloc.state;
    try {
      final Response response = await apiService.post(
        options: NetworkOption.instance.authority(
          options: options,
        ),
        AppUrl.calculateHeightByAge,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> heightByWeight({
    required Map<String, dynamic> data,
  }) async {
    var options = accessTokenBloc.state;
    try {
      final Response response = await apiService.post(
        options: NetworkOption.instance.authority(
          options: options,
        ),
        AppUrl.calculateHeightByWeight,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> calculateRecommend({
    required Map<String, dynamic> data,
  }) async {
    var options = accessTokenBloc.state;
    try {
      final Response response = await apiService.post(
        options: NetworkOption.instance.authority(
          options: options,
        ),
        AppUrl.calculateRecommend,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

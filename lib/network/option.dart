import 'package:dio/dio.dart';

import '../network/type.dart';
import '../storage/Access_Token/access_token_bloc.dart';

class NetworkOption {
  NetworkOption._();
  static final instance = NetworkOption._();

  Options authority({
    required StateAccessToken options,
  }) {
    return Options(
      headers: {
        'Authorization': '${options.type} ${options.token}',
        'Content-Type': ContentType.json.toTextCT(),
      },
    );
  }
}

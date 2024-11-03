import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../network/model/login/login_response.dart';

part 'access_token_event.dart';
part 'access_token_state.dart';

class AccessTokenBloc extends Bloc<EventAccessToken, StateAccessToken> {
  AccessTokenBloc()
      : super(
          StateAccessToken(
            token: '',
            type: '',
            expire: '1d',
            permission: Permission(
              level: 0,
              department: 0,
            ),
          ),
        ) {
    on<EventAccessToken>((event, emit) {
      emit(
        state.copyWith(
          token: event.token,
          type: event.type,
          expire: event.expire,
          permission: event.permission,
        ),
      );
    });
  }
}

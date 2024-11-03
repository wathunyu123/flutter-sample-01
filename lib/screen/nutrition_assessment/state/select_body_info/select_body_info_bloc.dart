import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../network/model/get_body_info/get_body_info_response.dart';

part 'select_body_info_event.dart';
part 'select_body_info_state.dart';

class SelectBodyInfoBloc
    extends Bloc<EventSelectBodyInfo, StateSelectBodyInfo> {
  SelectBodyInfoBloc()
      : super(
          StateSelectBodyInfo(
            model: GetBodyInfoResponseModel(
              id: 0,
              nickname: '',
              address: '',
              phone: '',
              birth: '',
              gender: '',
              date: '',
              height: '',
              weight: '',
              creator: '',
              result1: '',
              result2: '',
              result3: '',
              department: 0,
              createdAt: '',
              updatedAt: '',
            ),
          ),
        ) {
    on<EventSelectBodyInfo>((event, emit) async {
      emit(
        state.copyWith(
          model: event.model,
        ),
      );
    });
  }
}

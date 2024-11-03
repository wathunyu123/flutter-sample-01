import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'creator_event.dart';
part 'creator_state.dart';

class CreatorBloc extends Bloc<EventCreator, StateCreator> {
  CreatorBloc() : super(const StateCreator(by: '')) {
    on<EventCreator>((event, emit) {
      emit(
        state.copyWith(
          by: event.by,
        ),
      );
    });
  }
}

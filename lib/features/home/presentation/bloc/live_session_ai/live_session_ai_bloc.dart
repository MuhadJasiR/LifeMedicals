import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'live_session_ai_event.dart';
part 'live_session_ai_state.dart';

class LiveSessionAiBloc extends Bloc<LiveSessionAiEvent, LiveSessionAiState> {
  LiveSessionAiBloc() : super(LiveSessionAiInitial()) {
    on<LiveSessionAiEvent>((event, emit) {});
  }
}

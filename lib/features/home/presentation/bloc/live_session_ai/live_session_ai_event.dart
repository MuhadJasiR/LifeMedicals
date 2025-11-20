part of 'live_session_ai_bloc.dart';

abstract class LiveSessionAiEvent {
  const LiveSessionAiEvent();
}

class StartSession extends LiveSessionAiEvent {}

class StopSession extends LiveSessionAiEvent {}

class SendManualFrame extends LiveSessionAiEvent {}

class ToggleMute extends LiveSessionAiEvent {}

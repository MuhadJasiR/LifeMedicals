part of 'live_session_ai_bloc.dart';

abstract class LiveSessionAiState {
  const LiveSessionAiState();
}

final class LiveSessionAiInitial extends LiveSessionAiState {}

class SessionInitial extends LiveSessionAiState {}

class SessionConnecting extends LiveSessionAiState {}

class SessionConnected extends LiveSessionAiState {
  final bool isStreaming;
  final List<String> transcript;
  const SessionConnected({
    this.isStreaming = false,
    this.transcript = const [],
  });
}

class SessionResponse extends LiveSessionAiState {
  final String latestText;
  final List<String> transcript;
  const SessionResponse(this.latestText, this.transcript);
}

class SessionError extends LiveSessionAiState {
  final String message;
  const SessionError(this.message);
}

class SessionStopped extends LiveSessionAiState {}

part of 'home_screen_bloc.dart';

sealed class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object> get props => [];
}

final class HomeScreenInitial extends HomeScreenState {}

final class OpenWhatsAppState extends HomeScreenState {}

final class OpenDialerState extends HomeScreenState {}

final class LaunchSuccessState extends HomeScreenState {
  const LaunchSuccessState();
}

final class LaunchFailureState extends HomeScreenState {
  final String message;
  const LaunchFailureState(this.message);
}

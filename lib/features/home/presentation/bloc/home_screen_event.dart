part of 'home_screen_bloc.dart';

class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object> get props => [];
}

class OpenDialerEvent extends HomeScreenEvent {
  final String phoneNumber;
  const OpenDialerEvent(this.phoneNumber);
}

class OpenWhatsAppEvent extends HomeScreenEvent {
  final String phoneNumber;
  const OpenWhatsAppEvent(this.phoneNumber);
}

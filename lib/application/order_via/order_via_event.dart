part of 'order_via_bloc.dart';

@immutable
abstract class OrderViaEvent extends Equatable {}

class RedirectToWhatsappEvent extends OrderViaEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CapturePrescriptionImageEvent extends OrderViaEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RedirectToCallEvent extends OrderViaEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

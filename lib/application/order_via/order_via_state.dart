part of 'order_via_bloc.dart';

abstract class OrderViaState extends Equatable {}

@immutable
final class OrderViaInitial extends OrderViaState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PrescriptionImageCaptured extends OrderViaState {
  final XFile image;

  PrescriptionImageCaptured(this.image);
  @override
  // TODO: implement props
  List<Object?> get props => [image];
}

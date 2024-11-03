part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavEvent {}

class BottomNavChangeEvent extends BottomNavEvent {
  final int currentIdx;
  BottomNavChangeEvent(this.currentIdx);
}

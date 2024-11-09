import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'order_via_event.dart';
part 'order_via_state.dart';

class OrderViaBloc extends Bloc<OrderViaEvent, OrderViaState> {
  OrderViaBloc() : super(OrderViaInitial()) {
    on<OrderViaEvent>((event, emit) {});
  }
}

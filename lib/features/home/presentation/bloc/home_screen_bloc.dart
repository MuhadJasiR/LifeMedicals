import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<OpenWhatsAppEvent>(_onOpenWhatsApp);
    on<OpenDialerEvent>(_onOpenDialer);
  }
}

Future<void> _onOpenWhatsApp(
    OpenWhatsAppEvent event, Emitter<HomeScreenState> emit) async {
  final phoneNumber = event.phoneNumber.replaceAll('+', '');
  final url = Uri.parse('https://wa.me/$phoneNumber');

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
    emit(const LaunchSuccessState());
  } else {
    emit(LaunchFailureState('Could not launch WhatsApp for $phoneNumber'));
  }
}

Future<void> _onOpenDialer(
    OpenDialerEvent event, Emitter<HomeScreenState> emit) async {
  final phoneNumber = event.phoneNumber;
  final url = Uri.parse('tel:$phoneNumber');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
    emit(const LaunchSuccessState());
  } else {
    emit(LaunchFailureState('Could not launch dialer for $phoneNumber'));
  }
}

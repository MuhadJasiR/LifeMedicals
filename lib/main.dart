import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:life_medicals/core/theme/app_theme.dart';
import 'package:life_medicals/core/router/app_router.dart';
import 'package:life_medicals/features/home/presentation/bloc/home/home_screen_bloc.dart';
import 'package:life_medicals/features/prescription/presentation/cubit/prescription_upload_cubit.dart';
import 'package:life_medicals/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => HomeScreenBloc(),
    ),
    BlocProvider(create: (_) => PrescriptionUploadCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Life Medicals',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}

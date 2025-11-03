import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_medicals/core/theme/app_theme.dart';
import 'package:life_medicals/core/router/app_router.dart';
import 'package:life_medicals/features/home/presentation/bloc/home_screen_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => HomeScreenBloc(),
    ),
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

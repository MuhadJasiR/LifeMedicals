import 'package:go_router/go_router.dart';
import 'package:life_medicals/features/home/presentation/home_screen.dart';
import 'package:life_medicals/features/product_details/presentation/product_detail_screen.dart';
import 'package:life_medicals/features/landing/landing_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/landing',
  routes: [
    GoRoute(
        path: '/landing', builder: (context, state) => const LandingScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: '/productDetail',
        builder: (context, state) => const ProductDetailScreen()),
  ],
);

import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';  // Correct path
import '../screens/details_screen.dart';  // Correct path

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: '/details',
      name: 'details',
      builder: (_, __) => const DetailsScreen(),
    ),
  ],
);
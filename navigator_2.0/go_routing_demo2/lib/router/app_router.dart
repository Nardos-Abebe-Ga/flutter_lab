import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/product_detail_screen.dart';
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final filter = state.uri.queryParameters['filter'] ?? 'all';
        return ProductDetailScreen(id: id, filter: filter);
      },
    ),
  ],
);
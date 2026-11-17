import 'package:go_router/go_router.dart';

import '../screens/app_shell.dart';
import '../screens/destination_detail_page.dart';
import '../screens/destination_list_page.dart';
import '../screens/favorites_page.dart';
import '../screens/not_found_page.dart';

final appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) =>
          AppShell(location: state.uri.path, child: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const DestinationListPage(),
        ),
        GoRoute(
          path: '/favorit',
          builder: (context, state) => const FavoritesPage(),
        ),
        GoRoute(
          path: '/destinasi/:id',
          builder: (context, state) => DestinationDetailPage(
            destinationId: state.pathParameters['id'] ?? '',
          ),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => AppShell(
    location: state.uri.path,
    child: NotFoundPage(path: state.uri.path),
  ),
);

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home/learning_path_screen.dart';
import '../screens/main_wrapper.dart';

// Private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/learn',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainWrapper(navigationShell: navigationShell);
      },
      branches: [
        // Branch 1: Learn
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/learn',
              builder: (context, state) => const LearningPathScreen(),
            ),
          ],
        ),
        // Branch 2: Practice (Placeholder)
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/practice',
              builder: (context, state) => const Scaffold(
                body: Center(child: Text("Practice Section Coming Soon")),
              ),
            ),
          ],
        ),
        // Branch 3: Profile (Placeholder)
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const Scaffold(
                body: Center(child: Text("Profile Section Coming Soon")),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);

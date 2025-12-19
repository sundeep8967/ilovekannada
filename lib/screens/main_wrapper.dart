import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';

class MainWrapper extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainWrapper({
    super.key,
    required this.navigationShell,
  });

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        backgroundColor: Colors.white,
        indicatorColor: AppTheme.duoGreen.withOpacity(0.2),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: AppTheme.duoGrey),
            selectedIcon: Icon(Icons.home_filled, color: AppTheme.duoGreen),
            label: 'Learn',
          ),
          NavigationDestination(
            icon: Icon(Icons.fitness_center_outlined, color: AppTheme.duoGrey),
            selectedIcon: Icon(Icons.fitness_center, color: AppTheme.duoGreen),
            label: 'Practice',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline, color: AppTheme.duoGrey),
            selectedIcon: Icon(Icons.person, color: AppTheme.duoGreen),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

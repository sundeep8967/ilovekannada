import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/progress_screen.dart';
import 'screens/courses_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/name_input_screen.dart';
import 'services/progress_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ProgressService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I Love Kannada',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const AppRoot(),
    );
  }
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int _step = 0; // 0=welcome, 1=name input, 2=main

  @override
  void initState() {
    super.initState();
    if (ProgressService.hasUserName) {
      _step = 2;
    }
  }

  void _handleLetsGo() => setState(() => _step = 1);
  void _handleNameComplete() => setState(() => _step = 2);

  @override
  Widget build(BuildContext context) {
    switch (_step) {
      case 0:
        return WelcomeScreen(onSignIn: _handleLetsGo);
      case 1:
        return NameInputScreen(onComplete: _handleNameComplete);
      default:
        return const MainScreen();
    }
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ProgressScreen(),
    const CoursesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 24,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(CupertinoIcons.house_fill, 0),
                _buildNavItem(CupertinoIcons.chart_bar_fill, 1),
                _buildNavItem(CupertinoIcons.book_fill, 2),
                _buildNavItem(CupertinoIcons.person_fill, 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? AppTheme.primary : CupertinoColors.systemGrey,
            size: 24,
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: AppTheme.primary,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

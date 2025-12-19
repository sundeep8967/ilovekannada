import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'viewmodels/home_viewmodel.dart';
import 'viewmodels/user_progress_viewmodel.dart';

import 'router/app_router.dart'; // Ensure import

void main() {
  runApp(const ILoveKannadaApp());
}

class ILoveKannadaApp extends StatelessWidget {
  const ILoveKannadaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => UserProgressViewModel()),
      ],
      child: MaterialApp.router(
        title: 'I Love Kannada',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        routerConfig: router,
      ),
    );
  }
}


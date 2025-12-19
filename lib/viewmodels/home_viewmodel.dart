import 'package:flutter/material.dart';
import '../models/course_model.dart';
import '../theme/app_theme.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Unit> _units = [
    Unit(
      id: 1,
      title: "Unit 1",
      description: "Intro to Kannada script & basics",
      color: AppTheme.green,
      levels: [
        Level(id: 1, status: LevelStatus.completed, stars: 3),
        Level(id: 2, status: LevelStatus.completed, stars: 2),
        Level(id: 3, status: LevelStatus.active, stars: 0),
        Level(id: 4),
        Level(id: 5),
      ],
    ),
    Unit(
      id: 2,
      title: "Unit 2",
      description: "Greetings and Introductions",
      color: AppTheme.blue,
      levels: List.generate(6, (index) => Level(id: index + 1)),
    ),
  ];

  List<Unit> get units => _units;

  void unlockNextLevel(int currentUnitId, int currentLevelId) {
    // Logic to unlock logic would go here
    notifyListeners();
  }
  
  // Example method to handle level tap
  void onLevelTap(BuildContext context, int unitId, int levelId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Starting Level $levelId in Unit $unitId")),
    );
     // Navigation logic will allow be triggered from here or UI
  }
}

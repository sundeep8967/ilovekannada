import 'package:flutter/material.dart';

enum LevelStatus { locked, active, completed }

class Level {
  final int id;
  final LevelStatus status;
  final int stars; // 0-3

  Level({
    required this.id,
    this.status = LevelStatus.locked,
    this.stars = 0,
  });
}

class Unit {
  final int id;
  final String title;
  final String description;
  final Color color;
  final List<Level> levels;

  Unit({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.levels,
  });
}

// Mock Data
final List<Unit> mockUnits = [
  Unit(
    id: 1,
    title: "Unit 1",
    description: "Intro to Kannada script & basics",
    color: const Color(0xFF58CC02), // Green
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
    color: const Color(0xFF1CB0F6), // Blue
    levels: List.generate(6, (index) => Level(id: index + 1)),
  ),
];

import 'package:flutter/material.dart';

class UserProgressViewModel extends ChangeNotifier {
  int _hearts = 5;
  int _xp = 1250;
  final int _streak = 5;

  int get hearts => _hearts;
  int get xp => _xp;
  int get streak => _streak;

  void decreaseHeart() {
    if (_hearts > 0) {
      _hearts--;
      notifyListeners();
    }
  }
  
  void refillHearts() {
    _hearts = 5;
    notifyListeners();
  }

  void addXp(int amount) {
    _xp += amount;
    notifyListeners();
  }
}

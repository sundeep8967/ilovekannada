import 'package:shared_preferences/shared_preferences.dart';

/// Offline progress service - stores all user data locally
class ProgressService {
  static const _keyStreak = 'streak';
  static const _keyLastOpenDate = 'last_open_date';
  static const _keyTotalXP = 'total_xp';
  static const _keyCompletedLessons = 'completed_lessons';
  static const _keyCurrentUnit = 'current_unit';
  static const _keyCurrentLesson = 'current_lesson';
  static const _keyUserName = 'user_name';
  static const _keyDailyGoal = 'daily_goal';
  static const _keyLessonsToday = 'lessons_today';
  static const _keyLastLessonDate = 'last_lesson_date';

  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    await _checkStreak();
    await _resetDailyGoalIfNewDay();
  }

  // ==================== USER NAME ====================
  static String get userName => _prefs?.getString(_keyUserName) ?? '';
  
  static Future<void> setUserName(String name) async {
    await _prefs?.setString(_keyUserName, name);
  }

  static bool get hasUserName => userName.isNotEmpty;

  // ==================== STREAK ====================
  static int get streak => _prefs?.getInt(_keyStreak) ?? 0;

  static Future<void> _checkStreak() async {
    final today = DateTime.now().toIso8601String().substring(0, 10);
    final lastOpen = _prefs?.getString(_keyLastOpenDate);
    
    if (lastOpen == null) {
      // First time opening
      await _prefs?.setInt(_keyStreak, 1);
      await _prefs?.setString(_keyLastOpenDate, today);
    } else if (lastOpen != today) {
      final lastDate = DateTime.parse(lastOpen);
      final todayDate = DateTime.parse(today);
      final diff = todayDate.difference(lastDate).inDays;
      
      if (diff == 1) {
        // Consecutive day - increase streak
        final current = streak;
        await _prefs?.setInt(_keyStreak, current + 1);
      } else if (diff > 1) {
        // Missed a day - reset streak
        await _prefs?.setInt(_keyStreak, 1);
      }
      await _prefs?.setString(_keyLastOpenDate, today);
    }
  }

  // ==================== XP ====================
  static int get totalXP => _prefs?.getInt(_keyTotalXP) ?? 0;

  static Future<void> addXP(int amount) async {
    final current = totalXP;
    await _prefs?.setInt(_keyTotalXP, current + amount);
  }

  // ==================== DAILY GOAL ====================
  static int get dailyGoal => _prefs?.getInt(_keyDailyGoal) ?? 5;
  static int get lessonsToday => _prefs?.getInt(_keyLessonsToday) ?? 0;
  
  static double get dailyProgress {
    if (dailyGoal == 0) return 0;
    return (lessonsToday / dailyGoal).clamp(0.0, 1.0);
  }

  static bool get dailyGoalMet => lessonsToday >= dailyGoal;

  static Future<void> setDailyGoal(int goal) async {
    await _prefs?.setInt(_keyDailyGoal, goal);
  }

  static Future<void> _incrementLessonsToday() async {
    final current = lessonsToday;
    await _prefs?.setInt(_keyLessonsToday, current + 1);
  }

  static Future<void> _resetDailyGoalIfNewDay() async {
    final today = DateTime.now().toIso8601String().substring(0, 10);
    final lastLessonDate = _prefs?.getString(_keyLastLessonDate);
    
    if (lastLessonDate != null && lastLessonDate != today) {
      // New day - reset daily lessons count
      await _prefs?.setInt(_keyLessonsToday, 0);
    }
  }

  // ==================== COMPLETED LESSONS ====================
  static List<String> get completedLessons {
    return _prefs?.getStringList(_keyCompletedLessons) ?? [];
  }

  static bool isLessonCompleted(String lessonId) {
    return completedLessons.contains(lessonId);
  }

  static Future<void> markLessonCompleted(String lessonId, int xpReward) async {
    if (!isLessonCompleted(lessonId)) {
      final lessons = completedLessons;
      lessons.add(lessonId);
      await _prefs?.setStringList(_keyCompletedLessons, lessons);
      await addXP(xpReward);
      await _incrementLessonsToday();
      
      // Update last lesson date
      final today = DateTime.now().toIso8601String().substring(0, 10);
      await _prefs?.setString(_keyLastLessonDate, today);
    }
  }

  // ==================== CURRENT PROGRESS ====================
  static int get currentUnitIndex => _prefs?.getInt(_keyCurrentUnit) ?? 0;
  static int get currentLessonIndex => _prefs?.getInt(_keyCurrentLesson) ?? 0;

  static Future<void> setCurrentProgress(int unitIndex, int lessonIndex) async {
    await _prefs?.setInt(_keyCurrentUnit, unitIndex);
    await _prefs?.setInt(_keyCurrentLesson, lessonIndex);
  }

  // ==================== STATS ====================
  static int get completedCount => completedLessons.length;
  
  // ==================== LEVEL ====================
  static int get level => (totalXP / 500).floor() + 1;
  static String get levelTitle {
    if (level <= 5) return 'Rookie';
    if (level <= 15) return 'Local';
    if (level <= 30) return 'Expert';
    return 'Master';
  }
}

import 'package:shared_preferences/shared_preferences.dart';

/// Offline progress service - stores all user data locally
class ProgressService {
  static const _keyStreak = 'streak';
  static const _keyLastOpenDate = 'last_open_date';
  static const _keyTotalXP = 'total_xp';
  static const _keyCompletedLessons = 'completed_lessons';
  static const _keyCurrentUnit = 'current_unit';
  static const _keyCurrentLesson = 'current_lesson';

  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    await _checkStreak();
  }

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
}

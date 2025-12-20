import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../data/kannada_content.dart';
import '../data/lesson_models.dart';
import '../services/progress_service.dart';
import 'lesson_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<LessonUnit> _units = KannadaCurriculum.getAllUnits();
  int _currentUnitIndex = 0;
  int _currentLessonIndex = 0;

  LessonUnit get _currentUnit => _units[_currentUnitIndex];
  Lesson get _currentLesson => _currentUnit.lessons[_currentLessonIndex];

  void _startLesson() {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (_) => LessonScreen(lesson: _currentLesson)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.backgroundLight,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildStatsRow(),
              const SizedBox(height: 24),
              _buildDailyLessonCard(),
              const SizedBox(height: 24),
              _buildJourneySection(),
              const SizedBox(height: 24),
              _buildPracticeGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          // Profile picture with flag
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primary.withOpacity(0.1),
                  border: Border.all(color: AppTheme.primary, width: 2.5),
                ),
                child: const Center(
                  child: Text('🦉', style: TextStyle(fontSize: 28)),
                ),
              ),
              Positioned(
                bottom: -2,
                right: -2,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: CupertinoColors.systemGrey5, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text('🇮🇳', style: TextStyle(fontSize: 14)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 14),
          // Greeting
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Namaskara, ${ProgressService.userName}! 👋',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textMain,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Keep up the momentum',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.textSub,
                  ),
                ),
              ],
            ),
          ),
          // Notification icon - iOS style
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(CupertinoIcons.bell, color: AppTheme.textMain, size: 22),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _buildStatCard(
            icon: CupertinoIcons.flame_fill,
            iconColor: AppTheme.orangeAccent,
            value: '${ProgressService.streak}',
            label: 'DAYS',
          ),
          const SizedBox(width: 12),
          _buildStatCard(
            icon: CupertinoIcons.star_fill,
            iconColor: AppTheme.primary,
            value: '${ProgressService.totalXP}',
            label: 'XP',
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required String value,
    required String label,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 22),
            const SizedBox(width: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppTheme.textMain,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppTheme.textSub,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyLessonCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            // Image with gradient overlay
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                  child: Image.asset(
                    'assets/images/lesson_card.jpg',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 150,
                        width: double.infinity,
                        color: AppTheme.primary.withOpacity(0.3),
                        child: Center(
                          child: Text(_currentUnit.emoji, style: const TextStyle(fontSize: 60)),
                        ),
                      );
                    },
                  ),
                ),
                // Gradient overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),
                ),
                // Duration badge - iOS blur style
                Positioned(
                  bottom: 14,
                  left: 16,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      color: Colors.white.withOpacity(0.25),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(CupertinoIcons.clock, color: Colors.white, size: 13),
                          SizedBox(width: 4),
                          Text(
                            '15 min',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _currentLesson.title,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.textMain,
                                letterSpacing: -0.3,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${_currentUnit.emoji} Unit ${_currentUnit.order}: ${_currentUnit.title}',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppTheme.textSub,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Progress circle
                      _buildProgressCircle(0.75),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Start button - iOS style
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: _startLesson,
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppTheme.primary,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Start Lesson',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(CupertinoIcons.arrow_right, size: 18, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCircle(double progress) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        children: [
          // Background circle
          SizedBox(
            width: 48,
            height: 48,
            child: CircularProgressIndicator(
              value: 1,
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation(CupertinoColors.systemGrey5),
            ),
          ),
          // Progress circle
          SizedBox(
            width: 48,
            height: 48,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 3,
              strokeCap: StrokeCap.round,
              valueColor: const AlwaysStoppedAnimation(AppTheme.primary),
            ),
          ),
          // Play icon
          const Center(
            child: Icon(CupertinoIcons.play_fill, color: AppTheme.primary, size: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildJourneySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Unit header card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primary, AppTheme.primaryDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Text(_currentUnit.emoji, style: const TextStyle(fontSize: 36)),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'UNIT ${_currentUnit.order}',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.8),
                          letterSpacing: 1,
                        ),
                      ),
                      Text(
                        _currentUnit.title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${_getUnitCompletedCount()}/${_currentUnit.lessons.length}',
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Lessons list
          ...List.generate(_currentUnit.lessons.length, (i) {
            final lesson = _currentUnit.lessons[i];
            final isCompleted = ProgressService.isLessonCompleted(lesson.id);
            final prevCompleted = i == 0 || ProgressService.isLessonCompleted(_currentUnit.lessons[i - 1].id);
            final isUnlocked = isCompleted || prevCompleted;
            
            return _buildLessonRow(
              lessonNumber: i + 1,
              title: lesson.title,
              wordCount: lesson.words.length,
              xp: lesson.xpReward,
              isCompleted: isCompleted,
              isUnlocked: isUnlocked,
              onTap: isUnlocked ? () => _startSpecificLesson(lesson.id) : null,
            );
          }),
        ],
      ),
    );
  }

  int _getUnitCompletedCount() {
    return _currentUnit.lessons.where((l) => ProgressService.isLessonCompleted(l.id)).length;
  }

  void _startSpecificLesson(String lessonId) {
    final lesson = _currentUnit.lessons.firstWhere((l) => l.id == lessonId);
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (_) => LessonScreen(lesson: lesson)),
    );
  }

  Widget _buildLessonRow({
    required int lessonNumber,
    required String title,
    required int wordCount,
    required int xp,
    required bool isCompleted,
    required bool isUnlocked,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isCompleted ? AppTheme.greenAccent.withOpacity(0.1) : (isUnlocked ? Colors.white : Colors.grey.shade100),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isCompleted ? AppTheme.greenAccent : (isUnlocked ? AppTheme.primary.withOpacity(0.3) : Colors.grey.shade200),
              width: isCompleted || isUnlocked ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              // Status circle
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted ? AppTheme.greenAccent : (isUnlocked ? AppTheme.primary : Colors.grey.shade300),
                ),
                child: Center(
                  child: isCompleted
                      ? const Icon(CupertinoIcons.checkmark_alt, color: Colors.white, size: 20)
                      : Text('$lessonNumber', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: isUnlocked ? Colors.white : Colors.grey.shade500)),
                ),
              ),
              const SizedBox(width: 12),
              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lesson $lessonNumber: $title',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: isUnlocked ? AppTheme.textMain : Colors.grey),
                    ),
                    Text(
                      '$wordCount words • $xp XP',
                      style: TextStyle(fontSize: 11, color: isUnlocked ? AppTheme.textSub : Colors.grey.shade400),
                    ),
                  ],
                ),
              ),
              // Arrow/lock
              Icon(
                isUnlocked ? CupertinoIcons.chevron_right : CupertinoIcons.lock_fill,
                color: isCompleted ? AppTheme.greenAccent : (isUnlocked ? AppTheme.primary : Colors.grey.shade400),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPracticeGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Practice & Review',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textMain,
                  letterSpacing: -0.3,
                ),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primary,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.05,
            children: [
              _buildPracticeCard(
                icon: CupertinoIcons.textformat,
                iconBgColor: AppTheme.primary.withOpacity(0.12),
                iconColor: AppTheme.primary,
                title: 'Vocabulary',
                subtitle: '20 new words',
              ),
              _buildPracticeCard(
                icon: CupertinoIcons.book_fill,
                iconBgColor: AppTheme.greenAccent.withOpacity(0.12),
                iconColor: AppTheme.greenAccent,
                title: 'Grammar',
                subtitle: 'Past Tense',
              ),
              _buildPracticeCard(
                icon: CupertinoIcons.mic_fill,
                iconBgColor: AppTheme.purpleAccent.withOpacity(0.12),
                iconColor: AppTheme.purpleAccent,
                title: 'Speaking',
                subtitle: 'Pronunciation',
              ),
              _buildPracticeCard(
                icon: CupertinoIcons.rosette,
                iconBgColor: AppTheme.amberAccent.withOpacity(0.12),
                iconColor: AppTheme.amberAccent,
                title: 'League',
                subtitle: '#4 in Gold',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPracticeCard({
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 26),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppTheme.textMain,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.textSub,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
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
          _buildNavItem(CupertinoIcons.house_fill, isActive: true),
          _buildNavItem(CupertinoIcons.chart_bar_fill),
          _buildNavItem(CupertinoIcons.book_fill),
          _buildNavItem(CupertinoIcons.person_fill),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, {bool isActive = false}) {
    return Column(
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
            decoration: const BoxDecoration(
              color: AppTheme.primary,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}

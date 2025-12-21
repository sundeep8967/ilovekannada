import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../data/units_data.dart';
import '../data/lesson_models.dart';
import '../services/progress_service.dart';
import 'lesson_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),
              _buildStatsSection(),
              const SizedBox(height: 32),
              _buildContinueCard(),
              const SizedBox(height: 32),
              _buildUnitsSection(),
            ],
          ),
        ),
      ),
    );
  }

  // ==================== MINIMAL HEADER ====================
  Widget _buildHeader() {
    final greeting = _getGreeting();
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                ProgressService.hasUserName ? ProgressService.userName : 'Learner',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1D1D1F),
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
        // Streak badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(15),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              const Text('🔥', style: TextStyle(fontSize: 16)),
              const SizedBox(width: 6),
              Text(
                '${ProgressService.streak}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1D1D1F),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getGreeting() {
    final h = DateTime.now().hour;
    if (h < 12) return 'Good morning';
    if (h < 18) return 'Good afternoon';
    return 'Good evening';
  }

  // ==================== STATS SECTION ====================
  Widget _buildStatsSection() {
    return Row(
      children: [
        Expanded(child: _statCard('${ProgressService.totalXP}', 'XP Earned', CupertinoIcons.star_fill, const Color(0xFFFF9F0A))),
        const SizedBox(width: 12),
        Expanded(child: _statCard('${ProgressService.completedCount}', 'Lessons', CupertinoIcons.checkmark_circle_fill, const Color(0xFF30D158))),
        const SizedBox(width: 12),
        Expanded(child: _statCard('Lv ${ProgressService.level}', 'Level', CupertinoIcons.bolt_fill, const Color(0xFF5E5CE6))),
      ],
    );
  }

  Widget _statCard(String value, String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1D1D1F),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  // ==================== CONTINUE CARD ====================
  Widget _buildContinueCard() {
    final completed = ProgressService.completedLessons;
    Lesson? next;
    UnitInfo? unit;
    int idx = 0;

    for (final u in UnitsData.units) {
      for (int i = 0; i < u.lessons.length; i++) {
        if (!completed.contains(u.lessons[i].id)) {
          next = u.lessons[i];
          unit = u;
          idx = i + 1;
          break;
        }
      }
      if (next != null) break;
    }
    next ??= UnitsData.units.first.lessons.first;
    unit ??= UnitsData.units.first;

    return GestureDetector(
      onTap: () => _startLesson(next!),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: unit.color.withAlpha(30),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(child: Text(unit.icon, style: const TextStyle(fontSize: 24))),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'UP NEXT',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade500,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        next.title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1D1D1F),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(CupertinoIcons.chevron_right, color: Colors.grey.shade400, size: 20),
              ],
            ),
            const SizedBox(height: 20),
            // Progress bar
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      unit.title,
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                    Text(
                      'Lesson $idx of ${unit.lessonCount}',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: (idx - 1) / unit.lessonCount,
                    minHeight: 4,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(unit.color),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ==================== UNITS SECTION ====================
  Widget _buildUnitsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Units',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1D1D1F),
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: UnitsData.units.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (_, i) {
            final u = UnitsData.units[i];
            final done = u.lessons.where((l) => ProgressService.completedLessons.contains(l.id)).length;
            final locked = i > 0 && UnitsData.units[i - 1].lessons.any((l) => !ProgressService.completedLessons.contains(l.id));
            return _unitRow(u, done, locked);
          },
        ),
      ],
    );
  }

  Widget _unitRow(UnitInfo u, int done, bool locked) {
    return GestureDetector(
      onTap: locked ? null : () => _showUnitSheet(u),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: locked ? Colors.grey.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: locked
              ? null
              : [
                  BoxShadow(
                    color: Colors.black.withAlpha(8),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: locked ? Colors.grey.shade200 : u.color.withAlpha(30),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: locked
                    ? Icon(CupertinoIcons.lock_fill, color: Colors.grey.shade400, size: 20)
                    : Text(u.icon, style: const TextStyle(fontSize: 22)),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    u.title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: locked ? Colors.grey.shade500 : const Color(0xFF1D1D1F),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    locked ? 'Locked' : '$done of ${u.lessonCount} complete',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            if (!locked && done == u.lessonCount)
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFF30D158).withAlpha(30),
                  shape: BoxShape.circle,
                ),
                child: const Icon(CupertinoIcons.checkmark, color: Color(0xFF30D158), size: 14),
              )
            else if (!locked)
              Icon(CupertinoIcons.chevron_right, color: Colors.grey.shade400, size: 18),
          ],
        ),
      ),
    );
  }

  // ==================== HELPERS ====================
  void _startLesson(Lesson l) {
    Navigator.push(context, CupertinoPageRoute(builder: (_) => LessonScreen(lesson: l))).then((_) => setState(() {}));
  }

  void _showUnitSheet(UnitInfo u) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Material(
        color: Colors.transparent,
        child: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F5F7),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              width: 36,
              height: 5,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: u.color.withAlpha(30),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(child: Text(u.icon, style: const TextStyle(fontSize: 24))),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(u.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF1D1D1F))),
                        Text('${u.lessonCount} lessons', style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: u.lessons.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (_, i) {
                  final l = u.lessons[i];
                  final done = ProgressService.completedLessons.contains(l.id);
                  final locked = i > 0 && !ProgressService.completedLessons.contains(u.lessons[i - 1].id);
                  return GestureDetector(
                    onTap: locked ? null : () { Navigator.pop(context); _startLesson(l); },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: locked ? Colors.grey.shade200 : done ? const Color(0xFF30D158).withAlpha(30) : u.color.withAlpha(30),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: locked
                                  ? Icon(CupertinoIcons.lock_fill, color: Colors.grey.shade400, size: 14)
                                  : done
                                      ? const Icon(CupertinoIcons.checkmark, color: Color(0xFF30D158), size: 16)
                                      : Text('${i + 1}', style: TextStyle(color: u.color, fontWeight: FontWeight.w600, fontSize: 13)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              l.title,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: locked ? Colors.grey.shade400 : const Color(0xFF1D1D1F),
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Text('+${l.xpReward} XP', style: TextStyle(fontSize: 12, color: Colors.grey.shade500, decoration: TextDecoration.none)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

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

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _headerAnim;
  late Animation<double> _statsAnim;
  late Animation<double> _continueAnim;
  late Animation<double> _unitsAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _headerAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0, 0.3, curve: Curves.easeOut)),
    );
    _statsAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.15, 0.45, curve: Curves.easeOut)),
    );
    _continueAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.3, 0.6, curve: Curves.easeOut)),
    );
    _unitsAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.45, 0.8, curve: Curves.easeOut)),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              _fadeSlide(_headerAnim, _buildHeader()),
              const SizedBox(height: 32),
              _fadeSlide(_statsAnim, _buildStatsSection()),
              const SizedBox(height: 32),
              _fadeSlide(_continueAnim, _buildContinueCard()),
              const SizedBox(height: 32),
              _fadeSlide(_unitsAnim, _buildUnitsSection()),
            ],
          ),
        ),
      ),
    );
  }

  // Fade + Slide animation wrapper
  Widget _fadeSlide(Animation<double> anim, Widget child) {
    return AnimatedBuilder(
      animation: anim,
      builder: (_, __) => Opacity(
        opacity: anim.value,
        child: Transform.translate(
          offset: Offset(0, 20 * (1 - anim.value)),
          child: child,
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
        // Animated streak badge
        _PulseWidget(
          child: Container(
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
        Expanded(child: _StatCard(value: '${ProgressService.totalXP}', label: 'XP Earned', icon: CupertinoIcons.star_fill, color: const Color(0xFFFF9F0A), delay: 0)),
        const SizedBox(width: 12),
        Expanded(child: _StatCard(value: '${ProgressService.completedCount}', label: 'Lessons', icon: CupertinoIcons.checkmark_circle_fill, color: const Color(0xFF30D158), delay: 100)),
        const SizedBox(width: 12),
        Expanded(child: _StatCard(value: 'Lv ${ProgressService.level}', label: 'Level', icon: CupertinoIcons.bolt_fill, color: const Color(0xFF5E5CE6), delay: 200)),
      ],
    );
  }

  // ==================== CONTINUE CARD ====================
  Widget _buildContinueCard() {
    final completed = ProgressService.completedLessons;
    Lesson nextLesson = UnitsData.units.first.lessons.first;
    UnitInfo currentUnit = UnitsData.units.first;
    int idx = 1;

    outerLoop:
    for (final u in UnitsData.units) {
      for (int i = 0; i < u.lessons.length; i++) {
        if (!completed.contains(u.lessons[i].id)) {
          nextLesson = u.lessons[i];
          currentUnit = u;
          idx = i + 1;
          break outerLoop;
        }
      }
    }

    return _ScaleOnTap(
      onTap: () => _startLesson(nextLesson),
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
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.8, end: 1.0),
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.elasticOut,
                  builder: (_, scale, child) => Transform.scale(scale: scale, child: child),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: currentUnit.color.withAlpha(30),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(child: Text(currentUnit.icon, style: const TextStyle(fontSize: 24))),
                  ),
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
                        nextLesson.title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1D1D1F),
                        ),
                      ),
                    ],
                  ),
                ),
                _ShimmerArrow(),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(currentUnit.title, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                    Text('Lesson $idx of ${currentUnit.lessonCount}', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                  ],
                ),
                const SizedBox(height: 8),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: (idx - 1) / currentUnit.lessonCount),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOut,
                  builder: (_, value, __) => ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: value,
                      minHeight: 4,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation<Color>(currentUnit.color),
                    ),
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
            return _UnitRow(
              unit: u,
              done: done,
              locked: locked,
              index: i,
              onTap: () => _showUnitSheet(u),
            );
          },
        ),
      ],
    );
  }

  // ==================== HELPERS ====================
  void _startLesson(Lesson l) {
    Navigator.push(context, CupertinoPageRoute(builder: (_) => LessonScreen(lesson: l))).then((_) {
      setState(() {});
      _controller.reset();
      _controller.forward();
    });
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
                decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(3)),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(color: u.color.withAlpha(30), borderRadius: BorderRadius.circular(12)),
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
                    return _AnimatedLessonTile(
                      lesson: l,
                      index: i,
                      unit: u,
                      done: done,
                      locked: locked,
                      onTap: () { Navigator.pop(context); _startLesson(l); },
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

// ==================== ANIMATED WIDGETS ====================

// Pulse animation for streak badge
class _PulseWidget extends StatefulWidget {
  final Widget child;
  const _PulseWidget({required this.child});

  @override
  State<_PulseWidget> createState() => _PulseWidgetState();
}

class _PulseWidgetState extends State<_PulseWidget> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) => Transform.scale(
        scale: 1.0 + (_ctrl.value * 0.05),
        child: widget.child,
      ),
    );
  }
}

// Scale on tap animation
class _ScaleOnTap extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  const _ScaleOnTap({required this.child, required this.onTap});

  @override
  State<_ScaleOnTap> createState() => _ScaleOnTapState();
}

class _ScaleOnTapState extends State<_ScaleOnTap> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(duration: const Duration(milliseconds: 150), vsync: this);
    _scale = Tween<double>(begin: 1, end: 0.97).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _ctrl.forward(),
      onTapUp: (_) { _ctrl.reverse(); widget.onTap(); },
      onTapCancel: () => _ctrl.reverse(),
      child: AnimatedBuilder(
        animation: _scale,
        builder: (_, __) => Transform.scale(scale: _scale.value, child: widget.child),
      ),
    );
  }
}

// Shimmer arrow animation
class _ShimmerArrow extends StatefulWidget {
  @override
  State<_ShimmerArrow> createState() => _ShimmerArrowState();
}

class _ShimmerArrowState extends State<_ShimmerArrow> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this)..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) => Transform.translate(
        offset: Offset(_ctrl.value * 4, 0),
        child: Icon(CupertinoIcons.chevron_right, color: Colors.grey.shade400, size: 20),
      ),
    );
  }
}

// Stat card with bounce animation
class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color color;
  final int delay;

  const _StatCard({required this.value, required this.label, required this.icon, required this.color, required this.delay});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 600 + delay),
      curve: Curves.elasticOut,
      builder: (_, val, child) => Transform.scale(scale: val, child: child),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 10, offset: const Offset(0, 2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 12),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF1D1D1F))),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }
}

// Unit row with staggered animation
class _UnitRow extends StatelessWidget {
  final UnitInfo unit;
  final int done;
  final bool locked;
  final int index;
  final VoidCallback onTap;

  const _UnitRow({required this.unit, required this.done, required this.locked, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 400 + (index * 80)),
      curve: Curves.easeOut,
      builder: (_, val, child) => Opacity(
        opacity: val,
        child: Transform.translate(offset: Offset(30 * (1 - val), 0), child: child),
      ),
      child: _ScaleOnTap(
        onTap: locked ? () {} : onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: locked ? Colors.grey.shade100 : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: locked ? null : [BoxShadow(color: Colors.black.withAlpha(8), blurRadius: 10, offset: const Offset(0, 2))],
          ),
          child: Row(
            children: [
              Container(
                width: 44, height: 44,
                decoration: BoxDecoration(color: locked ? Colors.grey.shade200 : unit.color.withAlpha(30), borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: locked ? Icon(CupertinoIcons.lock_fill, color: Colors.grey.shade400, size: 20) : Text(unit.icon, style: const TextStyle(fontSize: 22)),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(unit.title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: locked ? Colors.grey.shade500 : const Color(0xFF1D1D1F))),
                    const SizedBox(height: 4),
                    Text(locked ? 'Locked' : '$done of ${unit.lessonCount} complete', style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
                  ],
                ),
              ),
              if (!locked && done == unit.lessonCount)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(color: const Color(0xFF30D158).withAlpha(30), shape: BoxShape.circle),
                  child: const Icon(CupertinoIcons.checkmark, color: Color(0xFF30D158), size: 14),
                )
              else if (!locked)
                Icon(CupertinoIcons.chevron_right, color: Colors.grey.shade400, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

// Animated lesson tile in modal
class _AnimatedLessonTile extends StatelessWidget {
  final Lesson lesson;
  final int index;
  final UnitInfo unit;
  final bool done;
  final bool locked;
  final VoidCallback onTap;

  const _AnimatedLessonTile({required this.lesson, required this.index, required this.unit, required this.done, required this.locked, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 300 + (index * 60)),
      curve: Curves.easeOut,
      builder: (_, val, child) => Opacity(
        opacity: val,
        child: Transform.translate(offset: Offset(0, 20 * (1 - val)), child: child),
      ),
      child: GestureDetector(
        onTap: locked ? null : onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Container(
                width: 32, height: 32,
                decoration: BoxDecoration(
                  color: locked ? Colors.grey.shade200 : done ? const Color(0xFF30D158).withAlpha(30) : unit.color.withAlpha(30),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: locked
                      ? Icon(CupertinoIcons.lock_fill, color: Colors.grey.shade400, size: 14)
                      : done
                          ? const Icon(CupertinoIcons.checkmark, color: Color(0xFF30D158), size: 16)
                          : Text('${index + 1}', style: TextStyle(color: unit.color, fontWeight: FontWeight.w600, fontSize: 13)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(lesson.title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: locked ? Colors.grey.shade400 : const Color(0xFF1D1D1F), decoration: TextDecoration.none)),
              ),
              Text('+${lesson.xpReward} XP', style: TextStyle(fontSize: 12, color: Colors.grey.shade500, decoration: TextDecoration.none)),
            ],
          ),
        ),
      ),
    );
  }
}

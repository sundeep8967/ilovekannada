import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../../viewmodels/user_progress_viewmodel.dart';
import '../../widgets/home/stat_pill.dart';
import '../../widgets/home/lesson_card.dart';
import '../../widgets/home/sidebar_cards.dart';

class LearningPathScreen extends StatelessWidget {
  const LearningPathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    final userProgress = Provider.of<UserProgressViewModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 700; // Tablet/Desktop

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(userProgress),
            
            // Main Content
            Expanded(
              child: isWide
                  ? _buildWideLayout(homeViewModel, userProgress)
                  : _buildNarrowLayout(homeViewModel, userProgress),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(UserProgressViewModel userProgress) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          // Stats
          StatPill(
            icon: Icons.local_fire_department,
            value: '${userProgress.streak}',
            color: Colors.orange.shade600,
            bgColor: Colors.orange.shade100,
          ),
          const SizedBox(width: 12),
          StatPill(
            icon: Icons.diamond,
            value: '500',
            color: Colors.blue.shade600,
            bgColor: Colors.blue.shade100,
          ),
          const SizedBox(width: 12),
          StatPill(
            icon: Icons.favorite,
            value: '${userProgress.hearts}',
            color: Colors.red.shade600,
            bgColor: Colors.red.shade100,
          ),
          const Spacer(),
          // Super button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.duoBlue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'GO SUPER',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWideLayout(HomeViewModel homeViewModel, UserProgressViewModel userProgress) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Learning Path (Left)
        Expanded(
          flex: 2,
          child: _buildLearningPath(homeViewModel),
        ),
        // Sidebar (Right)
        SizedBox(
          width: 320,
          child: _buildSidebar(userProgress),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(HomeViewModel homeViewModel, UserProgressViewModel userProgress) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildLearningPath(homeViewModel),
          Padding(
            padding: const EdgeInsets.all(16),
            child: _buildSidebar(userProgress),
          ),
        ],
      ),
    );
  }

  Widget _buildLearningPath(HomeViewModel homeViewModel) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Language path',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Follow the path to learn Kannada',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 24),
          
          // Lessons in zigzag
          ...homeViewModel.units.asMap().entries.map((entry) {
            final index = entry.key;
            final unit = entry.value;
            final isEven = index % 2 == 0;
            
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Align(
                alignment: isEven ? Alignment.centerLeft : Alignment.centerRight,
                child: LessonCard(
                  unit: unit,
                  onTap: () {
                    // Navigate to lesson
                  },
                ),
              ),
            );
          }).toList(),
          
          // Trophy at the end
          Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.purple.shade400, Colors.purple.shade600],
                ),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.purple.shade700, width: 4),
              ),
              child: const Icon(
                Icons.emoji_events,
                color: Colors.amber,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar(UserProgressViewModel userProgress) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          DailyGoalCard(currentXp: userProgress.xp % 20, goalXp: 20),
          const SizedBox(height: 16),
          const LeaderboardPromoCard(lessonsRemaining: 9),
          const SizedBox(height: 16),
          XpProgressCard(todayXp: userProgress.xp % 100),
        ],
      ),
    );
  }
}

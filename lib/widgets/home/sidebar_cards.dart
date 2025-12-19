import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class DailyGoalCard extends StatelessWidget {
  final int currentXp;
  final int goalXp;

  const DailyGoalCard({
    super.key,
    this.currentXp = 0,
    this.goalXp = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade200, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Daily Goal',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              Text(
                'EDIT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: AppTheme.duoBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$currentXp/$goalXp XP',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const Text(
                'Casual',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 12,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(6),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: goalXp > 0 ? currentXp / goalXp : 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.duoYellow,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LeaderboardPromoCard extends StatelessWidget {
  final int lessonsRemaining;

  const LeaderboardPromoCard({
    super.key,
    this.lessonsRemaining = 9,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue.shade400, Colors.blue.shade600],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.emoji_events, color: Colors.white, size: 32),
          ),
          const SizedBox(height: 12),
          const Text(
            'Unlock Leaderboards!',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Complete $lessonsRemaining more lessons to start competing',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue.shade100,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.33,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class XpProgressCard extends StatelessWidget {
  final int todayXp;

  const XpProgressCard({
    super.key,
    this.todayXp = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.shade200, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'XP Progress',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppTheme.duoGreen,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$todayXp',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Today',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

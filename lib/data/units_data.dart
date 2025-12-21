import 'package:flutter/material.dart';
import '../data/lesson_models.dart';

/// All 9 units with metadata for the gamified home screen
class UnitsData {
  static final List<UnitInfo> units = [
    UnitInfo(
      id: 'u1',
      title: 'Greetings & Introductions',
      shortTitle: 'Greetings',
      icon: '👋',
      color: const Color(0xFF4CAF50),
      lessonCount: 5,
      lessons: [
        Lesson(id: 'u1_l1', title: 'Greetings', description: 'Learn basic greetings', xpReward: 10, words: []),
        Lesson(id: 'u1_l2', title: 'Introducing Yourself', description: 'Introduce yourself', xpReward: 10, words: []),
        Lesson(id: 'u1_l3', title: 'How Are You?', description: 'Ask about wellbeing', xpReward: 10, words: []),
        Lesson(id: 'u1_l4', title: 'Basic Questions', description: 'Common questions', xpReward: 10, words: []),
        Lesson(id: 'u1_l5', title: 'Unit 1 Review', description: 'Review all greetings', xpReward: 25, words: []),
      ],
    ),
    UnitInfo(
      id: 'u2',
      title: 'Survival Kannada',
      shortTitle: 'Survival',
      icon: '🆘',
      color: const Color(0xFFFF9800),
      lessonCount: 5,
      lessons: [
        Lesson(id: 'u2_l1', title: 'Emergency Essentials', description: 'Essential phrases', xpReward: 10, words: []),
        Lesson(id: 'u2_l2', title: 'Market Survival', description: 'Shop at markets', xpReward: 10, words: []),
        Lesson(id: 'u2_l3', title: 'Food Basics', description: 'Order food basics', xpReward: 10, words: []),
        Lesson(id: 'u2_l4', title: 'Getting Around', description: 'Basic travel', xpReward: 10, words: []),
        Lesson(id: 'u2_l5', title: 'Health & Emergency', description: 'Medical phrases', xpReward: 25, words: []),
      ],
    ),
    UnitInfo(
      id: 'u3',
      title: 'Transport & Navigation',
      shortTitle: 'Transport',
      icon: '🚖',
      color: const Color(0xFF2196F3),
      lessonCount: 10,
      lessons: [
        Lesson(id: 'u3_l1', title: 'Hailing an Auto', description: 'Get an auto', xpReward: 10, words: []),
        Lesson(id: 'u3_l2', title: 'Giving Directions', description: 'Tell where to go', xpReward: 10, words: []),
        Lesson(id: 'u3_l3', title: 'Fare Negotiation', description: 'Bargain fares', xpReward: 10, words: []),
        Lesson(id: 'u3_l4', title: 'During the Ride', description: 'In-ride phrases', xpReward: 10, words: []),
        Lesson(id: 'u3_l5', title: 'Problems & Payment', description: 'Handle issues', xpReward: 10, words: []),
        Lesson(id: 'u3_l6', title: 'Bus Basics', description: 'Take buses', xpReward: 10, words: []),
        Lesson(id: 'u3_l7', title: 'Metro Basics', description: 'Use metro', xpReward: 10, words: []),
        Lesson(id: 'u3_l8', title: 'Combination Travel', description: 'Mix transport', xpReward: 10, words: []),
        Lesson(id: 'u3_l9', title: 'Finding Your Way', description: 'Ask directions', xpReward: 10, words: []),
        Lesson(id: 'u3_l10', title: 'Travel Mastery', description: 'Complete review', xpReward: 25, words: []),
      ],
    ),
    UnitInfo(
      id: 'u4',
      title: 'Food & Restaurants',
      shortTitle: 'Food',
      icon: '🍽️',
      color: const Color(0xFFE91E63),
      lessonCount: 5,
      lessons: [
        Lesson(id: 'u4_l1', title: 'Basic Ordering', description: 'Order food', xpReward: 10, words: []),
        Lesson(id: 'u4_l2', title: 'Dietary Needs', description: 'Restrictions', xpReward: 10, words: []),
        Lesson(id: 'u4_l3', title: 'Takeaway & Delivery', description: 'Parcel orders', xpReward: 10, words: []),
        Lesson(id: 'u4_l4', title: 'Complaints & Changes', description: 'Handle issues', xpReward: 10, words: []),
        Lesson(id: 'u4_l5', title: 'Restaurant Mastery', description: 'Complete review', xpReward: 25, words: []),
      ],
    ),
    UnitInfo(
      id: 'u5',
      title: 'Shopping & Markets',
      shortTitle: 'Shopping',
      icon: '🛒',
      color: const Color(0xFF9C27B0),
      lessonCount: 5,
      lessons: [
        Lesson(id: 'u5_l1', title: 'Vegetable Market', description: 'Buy veggies', xpReward: 10, words: []),
        Lesson(id: 'u5_l2', title: 'Kirana Shop', description: 'Grocery store', xpReward: 10, words: []),
        Lesson(id: 'u5_l3', title: 'Clothing & Sizing', description: 'Buy clothes', xpReward: 10, words: []),
        Lesson(id: 'u5_l4', title: 'Returns & Exchanges', description: 'Return items', xpReward: 10, words: []),
        Lesson(id: 'u5_l5', title: 'Shopping Mastery', description: 'Complete review', xpReward: 25, words: []),
      ],
    ),
    UnitInfo(
      id: 'u6',
      title: 'Home & Daily Needs',
      shortTitle: 'Home',
      icon: '🏠',
      color: const Color(0xFF00BCD4),
      lessonCount: 5,
      lessons: [
        Lesson(id: 'u6_l1', title: 'House Help Basics', description: 'Manage help', xpReward: 10, words: []),
        Lesson(id: 'u6_l2', title: 'Utility Problems', description: 'Handle utilities', xpReward: 10, words: []),
        Lesson(id: 'u6_l3', title: 'Repair People', description: 'Call repairs', xpReward: 10, words: []),
        Lesson(id: 'u6_l4', title: 'Neighbor Interactions', description: 'Talk to neighbors', xpReward: 10, words: []),
        Lesson(id: 'u6_l5', title: 'Home Management', description: 'Complete review', xpReward: 25, words: []),
      ],
    ),
    UnitInfo(
      id: 'u7',
      title: 'Money & Transactions',
      shortTitle: 'Money',
      icon: '💰',
      color: const Color(0xFF8BC34A),
      lessonCount: 5,
      lessons: [
        Lesson(id: 'u7_l1', title: 'Bank Basics', description: 'Use banks', xpReward: 10, words: []),
        Lesson(id: 'u7_l2', title: 'ATM Problems', description: 'ATM issues', xpReward: 10, words: []),
        Lesson(id: 'u7_l3', title: 'Digital Payments', description: 'UPI payments', xpReward: 10, words: []),
        Lesson(id: 'u7_l4', title: 'Receipts & Bills', description: 'Handle bills', xpReward: 10, words: []),
        Lesson(id: 'u7_l5', title: 'Money Mastery', description: 'Complete review', xpReward: 25, words: []),
      ],
    ),
    UnitInfo(
      id: 'u8',
      title: 'Health & Emergency',
      shortTitle: 'Health',
      icon: '🏥',
      color: const Color(0xFFF44336),
      lessonCount: 5,
      lessons: [
        Lesson(id: 'u8_l1', title: 'Pharmacy Basics', description: 'Buy medicine', xpReward: 10, words: []),
        Lesson(id: 'u8_l2', title: 'Doctor Visits', description: 'See doctor', xpReward: 10, words: []),
        Lesson(id: 'u8_l3', title: 'Describing Symptoms', description: 'Explain health', xpReward: 10, words: []),
        Lesson(id: 'u8_l4', title: 'Emergency Calls', description: 'Emergencies', xpReward: 10, words: []),
        Lesson(id: 'u8_l5', title: 'Health Mastery', description: 'Complete review', xpReward: 25, words: []),
      ],
    ),
    UnitInfo(
      id: 'u9',
      title: 'Tech & Services',
      shortTitle: 'Tech',
      icon: '📱',
      color: const Color(0xFF607D8B),
      lessonCount: 5,
      lessons: [
        Lesson(id: 'u9_l1', title: 'Phone & Internet', description: 'Tech issues', xpReward: 10, words: []),
        Lesson(id: 'u9_l2', title: 'Delivery Apps', description: 'Food delivery', xpReward: 10, words: []),
        Lesson(id: 'u9_l3', title: 'Cab Services', description: 'Ola/Uber', xpReward: 10, words: []),
        Lesson(id: 'u9_l4', title: 'Service Centers', description: 'Repairs', xpReward: 10, words: []),
        Lesson(id: 'u9_l5', title: 'Tech Mastery', description: 'Complete review', xpReward: 25, words: []),
      ],
    ),
  ];

  static int get totalLessons => units.fold(0, (sum, u) => sum + u.lessonCount);
}

class UnitInfo {
  final String id;
  final String title;
  final String shortTitle;
  final String icon;
  final Color color;
  final int lessonCount;
  final List<Lesson> lessons;

  const UnitInfo({
    required this.id,
    required this.title,
    required this.shortTitle,
    required this.icon,
    required this.color,
    required this.lessonCount,
    required this.lessons,
  });
}

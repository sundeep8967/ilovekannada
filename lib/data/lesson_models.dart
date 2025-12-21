/// Models for Kannada learning - English transliteration only

class LessonUnit {
  final String id;
  final String title;
  final String subtitle;
  final String emoji;
  final int order;
  final List<Lesson> lessons;

  const LessonUnit({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.emoji,
    required this.order,
    required this.lessons,
  });
}

class Lesson {
  final String id;
  final String title;
  final String description;
  final int xpReward;
  final List<Word> words;

  const Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.xpReward,

    required this.words,
    this.tips,
  });

  final List<String>? tips;
}

/// Word with English transliteration
class Word {
  final String kannada;        // Transliteration (e.g., "Namaskara")
  final String english;        // English meaning
  final String pronunciation;  // How to say it
  final String? example;       // Usage tip

  const Word({
    required this.kannada,
    required this.english,
    required this.pronunciation,
    this.example,
  });
}

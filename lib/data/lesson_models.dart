/// Models for Kannada learning content

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
  final List<LessonContent> content;

  const Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.xpReward,
    required this.content,
  });
}

abstract class LessonContent {
  String get type;
}

/// Vocabulary word with Kannada script, transliteration, and meaning
class VocabWord extends LessonContent {
  final String kannada;
  final String transliteration;
  final String english;
  final String? pronunciation; // Audio hint
  final String? example;

  @override
  String get type => 'vocab';

  VocabWord({
    required this.kannada,
    required this.transliteration,
    required this.english,
    this.pronunciation,
    this.example,
  });
}

/// Multiple choice quiz question
class QuizQuestion extends LessonContent {
  final String question;
  final String? kannadaText;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  @override
  String get type => 'quiz';

  QuizQuestion({
    required this.question,
    this.kannadaText,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

/// Speaking practice content
class SpeakingExercise extends LessonContent {
  final String kannada;
  final String transliteration;
  final String english;
  final String tip;

  @override
  String get type => 'speaking';

  SpeakingExercise({
    required this.kannada,
    required this.transliteration,
    required this.english,
    required this.tip,
  });
}

/// Listening exercise
class ListeningExercise extends LessonContent {
  final String audioText; // What is spoken
  final List<String> options;
  final int correctIndex;

  @override
  String get type => 'listening';

  ListeningExercise({
    required this.audioText,
    required this.options,
    required this.correctIndex,
  });
}

/// Reading comprehension
class ReadingExercise extends LessonContent {
  final String kannadaText;
  final String hint;
  final String question;
  final String expectedAnswer;

  @override
  String get type => 'reading';

  ReadingExercise({
    required this.kannadaText,
    required this.hint,
    required this.question,
    required this.expectedAnswer,
  });
}

/// Matching pairs exercise
class MatchingExercise extends LessonContent {
  final List<VocabWord> pairs;

  @override
  String get type => 'matching';

  MatchingExercise({required this.pairs});
}

/// Fill in the blank exercise
class FillBlankExercise extends LessonContent {
  final String sentence; // Use ___ for blank
  final String answer;
  final List<String> options;

  @override
  String get type => 'fill_blank';

  FillBlankExercise({
    required this.sentence,
    required this.answer,
    required this.options,
  });
}

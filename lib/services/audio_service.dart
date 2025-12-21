import 'package:flutter_tts/flutter_tts.dart';
import 'dart:io' show Platform;

/// Offline audio service using device's native TTS engine
class AudioService {
  static final FlutterTts _tts = FlutterTts();
  static bool _initialized = false;
  static String _currentLanguage = 'English';
  static bool _hasKannada = false;

  /// Initialize TTS with Kannada settings
  static Future<void> init() async {
    if (_initialized) return;
    
    // Check available languages
    final languages = await _tts.getLanguages as List<dynamic>?;
    final langList = languages?.map((e) => e.toString().toLowerCase()).toList() ?? [];
    
    // Try to set Kannada, fallback to Hindi or English
    if (langList.any((l) => l.contains('kn'))) {
      await _tts.setLanguage('kn-IN');
      _currentLanguage = 'Kannada';
      _hasKannada = true;
    } else if (langList.any((l) => l.contains('hi'))) {
      await _tts.setLanguage('hi-IN');
      _currentLanguage = 'Hindi';
    } else {
      await _tts.setLanguage('en-IN');
      _currentLanguage = 'English';
    }
    
    await _tts.setSpeechRate(0.4);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
    
    _initialized = true;
  }

  /// Get current TTS language being used
  static String get currentLanguage => _currentLanguage;
  
  /// Check if Kannada voice is available
  static bool get hasKannada => _hasKannada;

  /// Speak a word/phrase - uses Kannada text if Kannada voice available,
  /// otherwise uses pronunciation (romanized) for English/Hindi voice
  static Future<void> speakWord(String kannadaText, String? pronunciation) async {
    await init();
    // If we have Kannada TTS, speak the Kannada text directly
    // Otherwise use the pronunciation (romanized text) for English voice
    final textToSpeak = _hasKannada ? kannadaText : (pronunciation ?? kannadaText);
    await _tts.speak(textToSpeak);
  }

  /// Speak a word/phrase (legacy - always speaks given text)
  static Future<void> speak(String text) async {
    await init();
    await _tts.speak(text);
  }

  /// Stop speaking
  static Future<void> stop() async {
    await _tts.stop();
  }

  /// Check if TTS is available
  static Future<bool> isAvailable() async {
    final languages = await _tts.getLanguages;
    return languages != null && (languages as List).isNotEmpty;
  }

  /// Open TTS settings on Android/iOS
  static Future<void> openTTSSettings() async {
    if (Platform.isAndroid) {
      // On Android, we can open TTS settings directly
      await _tts.speak('Go to Settings, then Languages, then Text to Speech, and install Kannada');
    } else if (Platform.isIOS) {
      await _tts.speak('Go to Settings, then Accessibility, then Spoken Content, and add Kannada');
    }
  }

  /// Re-initialize to check for newly installed languages
  static Future<void> refresh() async {
    _initialized = false;
    await init();
  }

  /// Get list of available languages
  static Future<List<String>> getAvailableLanguages() async {
    final languages = await _tts.getLanguages as List<dynamic>?;
    return languages?.map((e) => e.toString()).toList() ?? [];
  }
  /// Play correct sound
  static Future<void> playCorrect() async {
     await init();
     await _tts.speak("Correct!");
  }

  /// Play incorrect sound
  static Future<void> playIncorrect() async {
     await init();
     await _tts.speak("Incorrect");
  }
}

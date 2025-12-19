import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../data/lesson_models.dart';

class MatchingScreen extends StatefulWidget {
  final List<Word>? words;
  
  const MatchingScreen({super.key, this.words});

  @override
  State<MatchingScreen> createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<MatchingScreen> {
  late List<_MatchCard> _cards;
  int? _selectedIndex;
  final Set<int> _matchedIndices = {};
  final Set<int> _wrongIndices = {};

  @override
  void initState() {
    super.initState();
    _initializeCards();
  }

  void _initializeCards() {
    final words = widget.words ?? [
      Word(kannada: 'Namaskara', english: 'Hello', pronunciation: ''),
      Word(kannada: 'Dhanyavada', english: 'Thank you', pronunciation: ''),
      Word(kannada: 'Houdu', english: 'Yes', pronunciation: ''),
      Word(kannada: 'Illa', english: 'No', pronunciation: ''),
      Word(kannada: 'Neeru', english: 'Water', pronunciation: ''),
    ];
    
    _cards = [];
    for (int i = 0; i < words.length && i < 5; i++) {
      _cards.add(_MatchCard(text: words[i].kannada, pairId: i, isKannada: true));
      _cards.add(_MatchCard(text: words[i].english, pairId: i, isKannada: false));
    }
    _cards.shuffle();
  }

  void _onCardTap(int index) {
    if (_matchedIndices.contains(index) || _wrongIndices.isNotEmpty) return;

    setState(() {
      if (_selectedIndex == null) {
        _selectedIndex = index;
      } else if (_selectedIndex == index) {
        _selectedIndex = null;
      } else {
        final first = _cards[_selectedIndex!];
        final second = _cards[index];

        if (first.pairId == second.pairId && first.isKannada != second.isKannada) {
          _matchedIndices.add(_selectedIndex!);
          _matchedIndices.add(index);
          _selectedIndex = null;
          
          if (_matchedIndices.length == _cards.length) {
            Future.delayed(const Duration(milliseconds: 500), () {
              if (mounted) Navigator.pop(context, true);
            });
          }
        } else {
          _wrongIndices.add(_selectedIndex!);
          _wrongIndices.add(index);
          Future.delayed(const Duration(milliseconds: 600), () {
            if (mounted) setState(() {
              _wrongIndices.clear();
              _selectedIndex = null;
            });
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.backgroundLight,
      child: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tap the matching pairs', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppTheme.textMain)),
                    const SizedBox(height: 24),
                    Expanded(child: _buildGrid()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.pop(context),
            child: Container(
              width: 40, height: 40,
              decoration: BoxDecoration(color: Colors.grey.shade100, shape: BoxShape.circle),
              child: const Icon(CupertinoIcons.xmark, color: AppTheme.textSub, size: 20),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: _matchedIndices.length / _cards.length,
                minHeight: 16,
                backgroundColor: Colors.grey.shade200,
                valueColor: const AlwaysStoppedAnimation(AppTheme.greenAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 1.4, crossAxisSpacing: 12, mainAxisSpacing: 12,
      ),
      itemCount: _cards.length,
      itemBuilder: (_, i) => _buildCard(i),
    );
  }

  Widget _buildCard(int index) {
    final card = _cards[index];
    final isSelected = _selectedIndex == index;
    final isMatched = _matchedIndices.contains(index);
    final isWrong = _wrongIndices.contains(index);

    Color bg = Colors.white;
    Color border = Colors.grey.shade200;
    Color text = AppTheme.textMain;

    if (isMatched) {
      bg = AppTheme.greenAccent.withOpacity(0.1);
      border = AppTheme.greenAccent;
      text = AppTheme.greenAccent;
    } else if (isWrong) {
      bg = Colors.red.withOpacity(0.1);
      border = Colors.red;
      text = Colors.red;
    } else if (isSelected) {
      bg = AppTheme.primary.withOpacity(0.1);
      border = AppTheme.primary;
      text = AppTheme.primary;
    }

    return GestureDetector(
      onTap: () => _onCardTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: border, width: 2),
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(card.text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: text), textAlign: TextAlign.center),
              ),
            ),
            if (isMatched)
              Positioned(
                top: -4, right: -4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(color: AppTheme.greenAccent, shape: BoxShape.circle),
                  child: const Icon(CupertinoIcons.checkmark, color: Colors.white, size: 14),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _MatchCard {
  final String text;
  final int pairId;
  final bool isKannada;
  _MatchCard({required this.text, required this.pairId, required this.isKannada});
}

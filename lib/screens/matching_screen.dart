import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';

class MatchingScreen extends StatefulWidget {
  const MatchingScreen({super.key});

  @override
  State<MatchingScreen> createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<MatchingScreen> {
  // Word pairs: [Kannada, English]
  final List<List<String>> _pairs = [
    ['ನಮಸ್ಕಾರ', 'Hello'],
    ['ಧನ್ಯವಾದ', 'Thank you'],
    ['ನೀರು', 'Water'],
    ['ಅನ್ನ', 'Rice'],
    ['ಹೌದು', 'Yes'],
  ];

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
    _cards = [];
    // Add all Kannada words
    for (int i = 0; i < _pairs.length; i++) {
      _cards.add(_MatchCard(
        text: _pairs[i][0],
        pairId: i,
        isKannada: true,
      ));
    }
    // Add all English words
    for (int i = 0; i < _pairs.length; i++) {
      _cards.add(_MatchCard(
        text: _pairs[i][1],
        pairId: i,
        isKannada: false,
      ));
    }
    // Shuffle the cards
    _cards.shuffle();
  }

  void _onCardTap(int index) {
    if (_matchedIndices.contains(index)) return;
    if (_wrongIndices.isNotEmpty) return; // Wait for wrong animation

    setState(() {
      _wrongIndices.clear();
      
      if (_selectedIndex == null) {
        // First selection
        _selectedIndex = index;
      } else if (_selectedIndex == index) {
        // Deselect
        _selectedIndex = null;
      } else {
        // Second selection - check if match
        final firstCard = _cards[_selectedIndex!];
        final secondCard = _cards[index];

        if (firstCard.pairId == secondCard.pairId && 
            firstCard.isKannada != secondCard.isKannada) {
          // Correct match!
          _matchedIndices.add(_selectedIndex!);
          _matchedIndices.add(index);
          _selectedIndex = null;

          // Check if all matched
          if (_matchedIndices.length == _cards.length) {
            Future.delayed(const Duration(milliseconds: 500), () {
              _showCompletionDialog();
            });
          }
        } else {
          // Wrong match
          _wrongIndices.add(_selectedIndex!);
          _wrongIndices.add(index);
          
          Future.delayed(const Duration(milliseconds: 800), () {
            setState(() {
              _wrongIndices.clear();
              _selectedIndex = null;
            });
          });
        }
      }
    });
  }

  void _showCompletionDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('🎉 Excellent!'),
        content: const Text('You matched all the pairs correctly!'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Continue'),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context, true);
            },
          ),
        ],
      ),
    );
  }

  bool get _allMatched => _matchedIndices.length == _cards.length;

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
                    Text(
                      'Tap the matching pairs',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textMain,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: _buildCardGrid(),
                    ),
                  ],
                ),
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.pop(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
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
          const SizedBox(width: 12),
          Row(
            children: [
              Icon(CupertinoIcons.heart_fill, color: Colors.red.shade400, size: 22),
              const SizedBox(width: 4),
              Text(
                '5',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.red.shade400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardGrid() {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: _cards.length,
      itemBuilder: (context, index) {
        return _buildCard(index);
      },
    );
  }

  Widget _buildCard(int index) {
    final card = _cards[index];
    final isSelected = _selectedIndex == index;
    final isMatched = _matchedIndices.contains(index);
    final isWrong = _wrongIndices.contains(index);

    Color bgColor = Colors.white;
    Color borderColor = Colors.grey.shade200;
    Color textColor = AppTheme.textMain;

    if (isMatched) {
      bgColor = AppTheme.greenAccent.withOpacity(0.1);
      borderColor = AppTheme.greenAccent;
      textColor = AppTheme.greenAccent;
    } else if (isWrong) {
      bgColor = Colors.red.withOpacity(0.1);
      borderColor = Colors.red;
      textColor = Colors.red;
    } else if (isSelected) {
      bgColor = AppTheme.primary.withOpacity(0.1);
      borderColor = AppTheme.primary;
      textColor = AppTheme.primary;
    }

    return GestureDetector(
      onTap: () => _onCardTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 2),
          boxShadow: isSelected || isMatched || isWrong
              ? null
              : [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(0, 3),
                  ),
                ],
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  card.text,
                  style: TextStyle(
                    fontSize: card.isKannada ? 20 : 16,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            if (isMatched)
              Positioned(
                top: -4,
                right: -4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppTheme.greenAccent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.greenAccent.withOpacity(0.3),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: const Icon(
                    CupertinoIcons.checkmark,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.backgroundLight,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          // Skip button (optional)
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.pop(context),
            child: Text(
              'SKIP',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppTheme.textSub,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const Spacer(),
          // Check button
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: _allMatched ? () => Navigator.pop(context, true) : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              decoration: BoxDecoration(
                color: _allMatched ? AppTheme.greenAccent : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(14),
                boxShadow: _allMatched
                    ? [
                        BoxShadow(
                          color: AppTheme.greenAccent.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Text(
                'CHECK',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: _allMatched ? Colors.white : Colors.grey.shade400,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MatchCard {
  final String text;
  final int pairId;
  final bool isKannada;

  _MatchCard({
    required this.text,
    required this.pairId,
    required this.isKannada,
  });
}

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class DuoButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final Color shadowColor;
  final double height;
  final double width;
  final bool isOutline;

  const DuoButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppTheme.green,
    this.shadowColor = AppTheme.greenShadow,
    this.height = 50,
    this.width = double.infinity,
    this.isOutline = false,
  });

  @override
  _DuoButtonState createState() => _DuoButtonState();
}

class _DuoButtonState extends State<DuoButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    // If outline, use white bg and colored border/text
    final Color bgColor = widget.isOutline ? AppTheme.white : widget.color;
    final Color shadow = widget.isOutline ? widget.shadowColor : widget.shadowColor;
    final Color textColor = widget.isOutline ? widget.color : AppTheme.white;
    const double borderHeight = 4.0;

    return Listener(
      onPointerDown: (_) {
        if (widget.onPressed != null) {
          setState(() => _isPressed = true);
        }
      },
      onPointerUp: (_) {
        if (widget.onPressed != null) {
          setState(() => _isPressed = false);
          widget.onPressed!();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        height: widget.height,
        width: widget.width,
        margin: EdgeInsets.only(
          top: _isPressed ? borderHeight : 0,
          bottom: _isPressed ? 0 : borderHeight,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: widget.isOutline 
              ? Border.all(color: widget.color, width: 2) 
              : null,
          boxShadow: _isPressed
              ? []
              : [
                  BoxShadow(
                    color: shadow,
                    offset: const Offset(0, borderHeight),
                    blurRadius: 0,
                  ),
                ],
        ),
        child: Center(
          child: Text(
            widget.text.toUpperCase(),
            style: AppTheme.buttonText.copyWith(
              color: textColor,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}

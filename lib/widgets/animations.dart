import 'package:flutter/material.dart';

/// Fade and slide animation - elements fade in while sliding up
class FadeSlideIn extends StatelessWidget {
  final Widget child;
  final int delay;
  final double offsetY;
  final Duration duration;

  const FadeSlideIn({
    super.key,
    required this.child,
    this.delay = 0,
    this.offsetY = 30,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: duration.inMilliseconds + delay),
      curve: Curves.easeOut,
      builder: (_, value, child) {
        final progress = delay > 0 
            ? ((value * (duration.inMilliseconds + delay) - delay) / duration.inMilliseconds).clamp(0.0, 1.0)
            : value;
        return Opacity(
          opacity: progress,
          child: Transform.translate(
            offset: Offset(0, offsetY * (1 - progress)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

/// Scale bounce animation - elements pop in with spring effect
class ScaleBounceIn extends StatelessWidget {
  final Widget child;
  final int delay;
  final Duration duration;

  const ScaleBounceIn({
    super.key,
    required this.child,
    this.delay = 0,
    this.duration = const Duration(milliseconds: 600),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: duration.inMilliseconds + delay),
      curve: Curves.elasticOut,
      builder: (_, value, child) {
        final progress = delay > 0 
            ? ((value * (duration.inMilliseconds + delay) - delay) / duration.inMilliseconds).clamp(0.0, 1.0)
            : value;
        return Transform.scale(
          scale: progress,
          child: child,
        );
      },
      child: child,
    );
  }
}

/// Slide in from right animation
class SlideInRight extends StatelessWidget {
  final Widget child;
  final int delay;
  final double offsetX;
  final Duration duration;

  const SlideInRight({
    super.key,
    required this.child,
    this.delay = 0,
    this.offsetX = 50,
    this.duration = const Duration(milliseconds: 400),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: duration.inMilliseconds + delay),
      curve: Curves.easeOut,
      builder: (_, value, child) {
        final progress = delay > 0 
            ? ((value * (duration.inMilliseconds + delay) - delay) / duration.inMilliseconds).clamp(0.0, 1.0)
            : value;
        return Opacity(
          opacity: progress,
          child: Transform.translate(
            offset: Offset(offsetX * (1 - progress), 0),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

/// Subtle pulse animation - gentle breathing effect
class PulseAnimation extends StatefulWidget {
  final Widget child;
  final double minScale;
  final double maxScale;
  final Duration duration;

  const PulseAnimation({
    super.key,
    required this.child,
    this.minScale = 1.0,
    this.maxScale = 1.05,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<PulseAnimation> createState() => _PulseAnimationState();
}

class _PulseAnimationState extends State<PulseAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(duration: widget.duration, vsync: this)..repeat(reverse: true);
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
        scale: widget.minScale + (_ctrl.value * (widget.maxScale - widget.minScale)),
        child: widget.child,
      ),
    );
  }
}

/// Scale on tap - pressed state animation
class ScaleOnTap extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double scaleDown;

  const ScaleOnTap({
    super.key,
    required this.child,
    this.onTap,
    this.scaleDown = 0.97,
  });

  @override
  State<ScaleOnTap> createState() => _ScaleOnTapState();
}

class _ScaleOnTapState extends State<ScaleOnTap> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(duration: const Duration(milliseconds: 100), vsync: this);
    _scale = Tween<double>(begin: 1, end: widget.scaleDown)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
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
      onTapUp: (_) {
        _ctrl.reverse();
        widget.onTap?.call();
      },
      onTapCancel: () => _ctrl.reverse(),
      child: AnimatedBuilder(
        animation: _scale,
        builder: (_, __) => Transform.scale(scale: _scale.value, child: widget.child),
      ),
    );
  }
}

/// Shimmer loading effect
class ShimmerEffect extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const ShimmerEffect({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(duration: widget.duration, vsync: this)..repeat();
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
      builder: (_, __) => ShaderMask(
        shaderCallback: (bounds) {
          return LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: const [Colors.white24, Colors.white60, Colors.white24],
            stops: [_ctrl.value - 0.3, _ctrl.value, _ctrl.value + 0.3],
          ).createShader(bounds);
        },
        child: widget.child,
      ),
    );
  }
}

/// Floating animation - gentle up and down movement
class FloatingAnimation extends StatefulWidget {
  final Widget child;
  final double amplitude;
  final Duration duration;

  const FloatingAnimation({
    super.key,
    required this.child,
    this.amplitude = 8,
    this.duration = const Duration(milliseconds: 2000),
  });

  @override
  State<FloatingAnimation> createState() => _FloatingAnimationState();
}

class _FloatingAnimationState extends State<FloatingAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(duration: widget.duration, vsync: this)..repeat(reverse: true);
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
        offset: Offset(0, -widget.amplitude + (_ctrl.value * widget.amplitude * 2)),
        child: widget.child,
      ),
    );
  }
}

/// Success checkmark animation
class SuccessAnimation extends StatefulWidget {
  final double size;
  final Color color;

  const SuccessAnimation({
    super.key,
    this.size = 80,
    this.color = Colors.green,
  });

  @override
  State<SuccessAnimation> createState() => _SuccessAnimationState();
}

class _SuccessAnimationState extends State<SuccessAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(duration: const Duration(milliseconds: 600), vsync: this)..forward();
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
      builder: (_, __) {
        return Transform.scale(
          scale: Curves.elasticOut.transform(_ctrl.value),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: widget.color.withAlpha(30),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_rounded,
              size: widget.size * 0.5,
              color: widget.color,
            ),
          ),
        );
      },
    );
  }
}

/// Staggered list animation wrapper
class StaggeredListItem extends StatelessWidget {
  final Widget child;
  final int index;
  final int delayPerItem;

  const StaggeredListItem({
    super.key,
    required this.child,
    required this.index,
    this.delayPerItem = 50,
  });

  @override
  Widget build(BuildContext context) {
    return FadeSlideIn(
      delay: index * delayPerItem,
      child: child,
    );
  }
}

/// Animated counter for numbers
class AnimatedCounter extends StatelessWidget {
  final int value;
  final TextStyle? style;
  final Duration duration;

  const AnimatedCounter({
    super.key,
    required this.value,
    this.style,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: value),
      duration: duration,
      builder: (_, val, __) => Text('$val', style: style),
    );
  }
}

/// Animated progress bar
class AnimatedProgressBar extends StatelessWidget {
  final double progress;
  final Color color;
  final Color backgroundColor;
  final double height;
  final Duration duration;

  const AnimatedProgressBar({
    super.key,
    required this.progress,
    this.color = Colors.blue,
    this.backgroundColor = Colors.grey,
    this.height = 8,
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: progress),
      duration: duration,
      curve: Curves.easeOut,
      builder: (_, val, __) => ClipRRect(
        borderRadius: BorderRadius.circular(height / 2),
        child: Stack(
          children: [
            Container(height: height, color: backgroundColor),
            FractionallySizedBox(
              widthFactor: val,
              child: Container(height: height, color: color),
            ),
          ],
        ),
      ),
    );
  }
}

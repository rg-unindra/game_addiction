import 'package:flutter/material.dart';

class DefaultFadeTransition extends StatefulWidget {
  const DefaultFadeTransition({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 1),
    this.start = 0.0,
    this.end = 1.0,
    this.delayDuration,
    this.curve = Curves.linearToEaseOut,
    this.withOffsetAnimation = true,
  }) : assert(start < end);

  final Widget child;
  final Duration duration;
  final Duration? delayDuration;
  final double start;
  final double end;
  final Curve curve;
  final bool withOffsetAnimation;

  @override
  createState() => _DefaultFadeTransitionState();
}

class _DefaultFadeTransitionState extends State<DefaultFadeTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> offsetAnimation;
  bool disposed = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    animation = Tween<double>(begin: widget.start, end: widget.end).animate(
      CurvedAnimation(parent: animationController, curve: widget.curve),
    );
    offsetAnimation = Tween<double>(begin: 15, end: 0).animate(
      CurvedAnimation(parent: animationController, curve: widget.curve),
    );
    disposed = false;
    startAnimation();
    super.initState();
  }

  void startAnimation() async {
    if (widget.delayDuration != null) {
      await Future.delayed(widget.delayDuration!);
    }
    if (!disposed) {
      animationController.forward();
    }
  }

  @override
  void dispose() {
    disposed = true;
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            0.0,
            widget.withOffsetAnimation ? offsetAnimation.value : 0.0,
          ),
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

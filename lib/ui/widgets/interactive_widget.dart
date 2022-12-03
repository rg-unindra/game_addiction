import 'package:flutter/material.dart';

class InteractiveWidget extends StatefulWidget {
  const InteractiveWidget({
    super.key,
    required this.child,
    required this.onTap,
    this.disabled = false,
    this.minScale = 0.95,
  });

  final Widget child;
  final VoidCallback onTap;
  final bool disabled;
  final double minScale;

  @override
  State<InteractiveWidget> createState() => _InteractiveWidgetState();
}

class _InteractiveWidgetState extends State<InteractiveWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween(
      begin: 1.0,
      end: widget.minScale,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.disabled ? 0.4 : 1.0,
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) {
          if (widget.disabled) return;
          _controller.forward();
        },
        onTapUp: (_) {
          if (widget.disabled) return;
          _controller.reverse();
        },
        onTapCancel: () {
          if (widget.disabled) return;
          _controller.reverse();
          widget.onTap();
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Transform.scale(
            scale: _animation.value,
            child: child,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

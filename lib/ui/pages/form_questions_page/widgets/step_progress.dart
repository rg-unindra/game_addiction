import 'package:flutter/material.dart';
import 'package:game_addiction/core/utils/extensions/extensions.dart';

class StepProgress extends StatelessWidget {
  const StepProgress({
    super.key,
    this.progress = 0.0,
    this.step = 2,
    this.currentStep = 0,
    this.color = const Color(0xFF9D55EA),
    this.backgroundColor = const Color(0x55FFFFFF),
  });

  final double progress;
  final int step;
  final int currentStep;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).r(context),
      child: CustomPaint(
        painter: _ProgressPainter(
          progress: progress,
          progressColor: color,
          backgroundColor: backgroundColor,
          currentStep: currentStep,
          step: step,
          context: context,
        ),
        size: Size(
          double.maxFinite,
          context.responsiveDoubleH(8),
        ),
      ),
    );
  }
}

class _ProgressPainter extends CustomPainter {
  final Color backgroundColor;
  final Color progressColor;
  final double progress;
  final int step;
  final int currentStep;
  final BuildContext context;

  const _ProgressPainter({
    required this.backgroundColor,
    required this.progressColor,
    required this.progress,
    required this.step,
    required this.currentStep,
    required this.context,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final widthStep = width / step;
    Paint backgroundPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = context.responsiveDoubleH(10)
      ..color = backgroundColor
      ..strokeCap = StrokeCap.round;

    Paint progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = context.responsiveDoubleH(10)
      ..color = progressColor
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset.zero, Offset(width, 0), backgroundPaint);
    canvas.drawLine(
        Offset.zero, Offset(widthStep * (currentStep + 1), 0), progressPaint);
  }

  @override
  bool shouldRepaint(covariant _ProgressPainter oldDelegate) =>
      backgroundColor != oldDelegate.backgroundColor ||
      step != oldDelegate.step ||
      progress != oldDelegate.progress ||
      currentStep != oldDelegate.currentStep;
}

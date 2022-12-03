import 'package:flutter/material.dart';
import 'package:game_addiction/core/utils/extensions/extensions.dart';
import 'package:game_addiction/ui/widgets/interactive_widget.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    required this.onTap,
    this.disabled = false,
    this.height = 44.0,
    this.width,
    this.backgroundColor,
    this.strokeColor,
  });

  final String text;
  final VoidCallback onTap;
  final bool disabled;
  final double height;
  final double? width;
  final Color? backgroundColor;
  final Color? strokeColor;

  @override
  Widget build(BuildContext context) {
    return InteractiveWidget(
      onTap: onTap,
      disabled: disabled,
      child: SizedBox(
        width: context.responsiveDoubleH(width ?? 200),
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: strokeColor ?? const Color(0xFFBF4A44),
                  borderRadius: BorderRadius.circular(
                    context.responsiveDoubleR(10),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              left: 1,
              top: 1,
              right: 4,
              bottom: 4,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: backgroundColor ?? const Color(0xFFEE9D05),
                  borderRadius: BorderRadius.circular(
                    context.responsiveDoubleR(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16).r(context),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: context.responsiveDoubleSP(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

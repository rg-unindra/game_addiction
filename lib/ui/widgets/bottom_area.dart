import 'package:flutter/material.dart';
import 'package:game_addiction/core/utils/extensions/extensions.dart';

class BottomArea extends StatelessWidget {
  const BottomArea({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        16,
        20,
        context.hasBottomArea ? 0 : 16,
      ).r(context),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: SafeArea(
        child: child,
      ),
    );
  }
}

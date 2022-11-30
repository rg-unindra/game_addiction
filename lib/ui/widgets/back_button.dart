import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_addiction/core/utils/extensions/extensions.dart';
import 'package:game_addiction/ui/widgets/interactive_widget.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final iconColor = theme.iconTheme.color;
    return InteractiveWidget(
      onTap: () => Navigator.pop(context),
      child: Center(
        child: SvgPicture.asset(
          'assets/icons/ic_back.svg',
          color: color ?? iconColor,
          height: context.responsiveDoubleR(24),
          width: context.responsiveDoubleR(24),
        ),
      ),
    );
  }
}

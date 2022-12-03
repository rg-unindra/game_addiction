import 'package:flutter/material.dart';
import 'package:game_addiction/core/utils/extensions/extensions.dart';

class WebScaffold extends StatelessWidget {
  const WebScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (context.isDekstop) {
          return SizedBox.expand(
            child: ColoredBox(
              color: theme.scaffoldBackgroundColor,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 400,
                  height: size.width,
                  child: child,
                ),
              ),
            ),
          );
        } else {
          return child;
        }
      },
    );
  }
}

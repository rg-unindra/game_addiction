import 'package:flutter/material.dart';
import 'package:game_addiction/core/utils/constans.dart';
import 'package:game_addiction/core/utils/extensions/extensions.dart';
import 'package:game_addiction/ui/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    final children = [
      SizedBox.square(
        dimension: context.responsiveDoubleR(50),
        child: Transform.scale(
            scale: 3, child: const RiveAnimation.asset('assets/rives/success')),
      ),
      SizedBox(height: context.responsiveDoubleH(16)),
      Text(
        "Selesai",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: context.responsiveDoubleSP(30),
        ),
      ),
      SizedBox(height: context.responsiveDoubleH(4)),
      Text(
        "Horee! Anda telah selesai mengisi form",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: context.responsiveDoubleSP(16),
        ),
      ),
      SizedBox(height: context.responsiveDoubleH(30)),
      DefaultButton(
        text: "Lihat Hasil",
        onTap: () => context.pushNamed(Constans.results),
      ),
    ];

    return WebScaffold(
      child: Scaffold(
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              children.length,
              (index) => DefaultFadeTransition(
                delayDuration: Duration(milliseconds: (index + 1) * 300),
                withOffsetAnimation: true,
                child: children[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

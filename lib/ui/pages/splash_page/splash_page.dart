import 'package:flutter/material.dart';
import 'package:game_addiction/core/utils/constans.dart';
import 'package:game_addiction/ui/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFA09EEF),
                      Color(0xFF6018BC),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * .35,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Constans.appName,
                    style: GoogleFonts.yesevaOne(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    Constans.appDescription,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  DefaultButton(
                    width: 100,
                    onTap: () => context.goNamed(Constans.identity),
                    text: "Mulai",
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/images/bg_splash.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

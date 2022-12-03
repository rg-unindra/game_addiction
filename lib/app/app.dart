import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_addiction/core/utils/constans.dart';
import 'package:game_addiction/ui/pages/pages.dart';
import 'package:game_addiction/ui/pages/results_page/results_page.dart';
import 'package:game_addiction/ui/utils/utils.dart';
import 'package:go_router/go_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    FlutterNativeSplash.remove();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => child!,
      designSize: const Size(375, 812),
      child: MaterialApp.router(
        routerConfig: _router,
        theme: AppThemeData().lightTheme(),
        darkTheme: AppThemeData().darkTheme(),
        themeMode: ThemeMode.dark,
      ),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: Constans.splashPath,
      name: Constans.splash,
      builder: (context, state) => const SplashPage(),
      routes: [
        GoRoute(
          path: Constans.identityPath,
          name: Constans.identity,
          builder: (context, state) => const FormIdentityPage(),
        ),
        GoRoute(
          path: Constans.questionPath,
          name: Constans.question,
          builder: (context, state) => const FormQuestionPage(),
        ),
        GoRoute(
          path: Constans.successPath,
          name: Constans.success,
          builder: (context, state) => const SuccessPage(),
        ),
        GoRoute(
          path: Constans.resultsPath,
          name: Constans.results,
          builder: (context, state) => const ResultsPage(),
        ),
      ],
    ),
  ],
);

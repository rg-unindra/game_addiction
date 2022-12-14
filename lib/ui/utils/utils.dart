import 'package:flutter/material.dart';

class AppThemeData {
  static const MaterialColor myColor = MaterialColor(
    0xFFBE5EFE,
    <int, Color>{
      50: Color(0xFFD7C9FF),
      100: Color(0xFFCBB9FF),
      200: Color(0xFFAE94F9),
      300: Color(0xFFA586FF),
      400: Color(0xFF9D55EA),
      500: Color(0xFF873ED5),
      600: Color(0xFF8237D3),
      700: Color(0xFF8332DA),
      800: Color(0xFF7B28D2),
      900: Color(0xFF7014D2),
    },
  );

  static const Color purpleColor = Color(0xFFBE5EFE);
  static const Color blueColor = Color(0xFF2465F8);
  static const Color redColor = Colors.redAccent;
  static const Color greenColor = Color(0xFF93CC7E);
  static const Color darkColor = Color(0xFF0C0B10);
  static const Color blackColor = Color(0xFF343434);
  static const Color whiteColor = Colors.white;

  ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: myColor,
      primaryColor: myColor,
      scaffoldBackgroundColor: whiteColor,
      brightness: Brightness.light,
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: whiteColor),
      appBarTheme: appBarTheme(isDark: false),
      highlightColor: myColor.withOpacity(.3),
      splashColor: myColor.shade200.withOpacity(.2),
      hoverColor: myColor.shade100.withOpacity(.1),
      fontFamily: 'quicksand',
      tooltipTheme: const TooltipThemeData(
        decoration: BoxDecoration(
          color: darkColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: whiteColor,
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: darkColor,
        actionTextColor: myColor,
      ),
      dividerTheme: DividerThemeData(
        color: blackColor.withOpacity(.2),
      ),
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      primarySwatch: myColor,
      primaryColor: myColor,
      scaffoldBackgroundColor: darkColor,
      useMaterial3: true,
      brightness: Brightness.dark,
      appBarTheme: appBarTheme(isDark: true),
      highlightColor: myColor.withOpacity(.3),
      splashColor: myColor.shade200.withOpacity(.2),
      hoverColor: myColor.shade100.withOpacity(.1),
      fontFamily: 'quicksand',
      tooltipTheme: const TooltipThemeData(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: blackColor,
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: myColor,
        contentTextStyle: TextStyle(color: whiteColor),
        actionTextColor: whiteColor,
      ),
      dividerTheme: DividerThemeData(
        color: whiteColor.withOpacity(.2),
      ),
    );
  }

  AppBarTheme appBarTheme({bool isDark = false}) {
    final foregroundColor = isDark ? whiteColor : blackColor;
    if (isDark) {
      return AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: foregroundColor,
        ),
      );
    } else {
      return AppBarTheme(
        color: whiteColor,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: foregroundColor,
        ),
      );
    }
  }
}

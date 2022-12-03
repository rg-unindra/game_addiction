import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension BuildContextExtensions on BuildContext {
  Size get size => MediaQuery.of(this).size;

  bool get isPotrait => size.width < size.height;

  double get responsiveWidth => isPotrait ? size.width : size.height;

  double get responsiveHeight => isPotrait ? size.height : size.width;

  double get halfWidth => responsiveWidth / 2;

  bool get isTablet => responsiveWidth > 600;

  bool get isDekstop => responsiveWidth > 700;

  double marginHorToViewport(double value) {
    final responsiveValue = value.w * 2;
    final widthPercent = responsiveWidth * 1;
    final margin = 1 - responsiveValue / widthPercent;

    return margin;
  }

  double responsiveDoubleH(
    double value, {
    double? miniPhone,
    double? tablet,
  }) {
    if (value == 0) return value;
    if (isMiniPhone) return miniPhone ?? value;
    if (isTablet) return tablet ?? value;
    return value.h;
  }

  double responsiveDoubleW(
    double value, {
    double? miniPhone,
    double? tablet,
  }) {
    if (value == 0) return value;
    if (isMiniPhone) return miniPhone ?? value;
    if (isTablet) return tablet ?? value;
    return value.w;
  }

  double responsiveDoubleR(
    double value, {
    double? miniPhone,
    double? tablet,
  }) {
    if (value == 0) return value;
    if (isMiniPhone) return miniPhone ?? value;
    if (isTablet) return tablet ?? value;
    return value.r;
  }

  double responsiveDoubleSP(
    double value, {
    double? miniPhone,
    double? tablet,
  }) {
    if (value == 0) return value;
    if (isMiniPhone) return miniPhone ?? value;
    if (isTablet) return tablet ?? value;
    return value.sp;
  }

  bool get hasBottomArea {
    return MediaQuery.of(this).viewPadding.bottom >= 10;
  }

  double get viewBottomArea {
    return MediaQuery.of(this).viewPadding.bottom;
  }

  double get topPadding {
    return MediaQuery.of(this).padding.top;
  }

  bool get isMiniPhone {
    return responsiveHeight <= 680.0;
  }

  int responsiveInt(
    int value, {
    int? miniPhone,
    int? tablet,
  }) {
    if (isTablet) return tablet ?? value;
    if (isMiniPhone) return miniPhone ?? value;
    return value;
  }

  T responsiveType<T>(
    T value, {
    T? miniPhone,
    T? tablet,
  }) {
    if (isMiniPhone) return miniPhone ?? value;
    if (isTablet) return tablet ?? value;
    return value;
  }

  EdgeInsets get insetPaddingDialog {
    if (isTablet) {
      return EdgeInsets.symmetric(horizontal: responsiveWidth * .25);
    } else {
      return const EdgeInsets.symmetric(horizontal: 20);
    }
  }
}

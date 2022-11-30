import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'build_context_extensions.dart';

extension EdgeInsetsExtensions on EdgeInsets {
  EdgeInsets r(BuildContext context) {
    if (context.isTablet) return this;
    List<double> temp = [left, top, right, bottom];

    for (int i = 0; i < temp.length; i++) {
      if (temp[i] > 0) {
        final v = temp[i];
        final isWidth = i % 2 == 0;
        temp.removeAt(i);
        temp.insert(i, isWidth ? v.w : v.h);
      }
    }

    return EdgeInsets.fromLTRB(temp[0], temp[1], temp[2], temp[3]);
  }
}

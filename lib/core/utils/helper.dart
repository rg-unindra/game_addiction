import 'package:flutter/foundation.dart';

String textFieldAddDummy(String text) {
  if (kDebugMode) {
    return text;
  } else {
    return '';
  }
}

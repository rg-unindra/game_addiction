import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:game_addiction/ui/utils/utils.dart';

enum ClassificationType {
  mild,
  moderate,
  serious,
}

class Classification extends Equatable {
  final String value;
  final ClassificationType type;

  const Classification({
    required this.value,
    required this.type,
  });

  @override
  List<Object?> get props => [value, type];
}

extension ClassificationTypeExtensions on ClassificationType {
  Color get toColor {
    switch (this) {
      case ClassificationType.mild:
        return AppThemeData.blueColor;
      case ClassificationType.moderate:
        return const Color(0xFFEE9D05);
      default:
        return AppThemeData.redColor;
    }
  }

  String get toText {
    switch (this) {
      case ClassificationType.mild:
        return "Ringan";
      case ClassificationType.moderate:
        return "Sedang";
      default:
        return "Berat";
    }
  }
}

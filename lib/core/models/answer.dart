import 'dart:math';

import 'package:equatable/equatable.dart';

import 'classification.dart';
import 'question.dart';

class Answer extends Equatable {
  final Question question;
  final Classification answerClassification;

  const Answer({
    required this.question,
    required this.answerClassification,
  });

  Answer copyWith({
    Question? question,
    Classification? answerClassification,
  }) {
    return Answer(
      question: question ?? this.question,
      answerClassification: answerClassification ?? this.answerClassification,
    );
  }

  @override
  List<Object?> get props => [
        question,
        answerClassification,
      ];
}

extension ListAnswerExtensions on List<Answer> {
  int indexOfAnswer(Question question) {
    for (int i = 0; i < length; i++) {
      if (this[i].question == question) {
        return i;
      }
    }

    return -1;
  }

  Map<ClassificationType, List<Answer>> get tableData {
    Map<ClassificationType, List<Answer>> groupAnswers = {};

    for (var type in ClassificationType.values) {
      final newAnswerGroup =
          where((e) => e.answerClassification.type == type).toList();
      groupAnswers[type] = newAnswerGroup;
    }

    return groupAnswers;
  }

  int get maxAnswersGroup {
    int temp = 0;

    tableData.forEach((key, value) {
      temp = max(temp, value.length);
    });

    return 0;
  }

  int get minAnswersGroup {
    int temp = 999999999;

    tableData.forEach((key, value) {
      temp = min(temp, value.length);
    });

    return 0;
  }

  ClassificationType get classificationResults {
    var type = ClassificationType.mild;
    int temp = 0;
    tableData.forEach((key, value) {
      if (value.length > temp) {
        type = key;
        temp = value.length;
      }
    });

    return type;
  }

  int get groupLength => tableData.length;
}

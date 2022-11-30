import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_addiction/core/models/answer.dart';
import 'package:game_addiction/core/models/question.dart';

final answerProvider = StateNotifierProvider<AnswerProvider, List<Answer>>(
  (ref) => AnswerProvider(),
);

class AnswerProvider extends StateNotifier<List<Answer>> {
  AnswerProvider([List<Answer>? initialAnswer]) : super(initialAnswer ?? []);

  void add(Answer answer, Question question) {
    final index = state.indexOfAnswer(question);
    final isUpdate = index != -1;

    if (isUpdate) {
      final oldState = state;
      oldState.removeAt(index);
      oldState.insert(index, answer);
      state = [...oldState];
    } else {
      state = [...state, answer];
    }
  }
}

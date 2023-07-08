import 'package:av_spanish_admin/services/models/models.dart';
import 'package:flutter/material.dart';

/// A [ChangeNotifier] used to keep track of the true / false questions to be added
/// into a true / false quiz (currently 10 questions at a time max).
class AddTFQuizQuestionsStateNotifier extends ChangeNotifier {
  final List<TFQuestion> _questions = [];

  /// Checks whether the question to be added already matches the question number of a
  /// question inside the [_questions] list. This helps avoiding duplicate questions.
  ///
  /// If the question doesn't match an existing question (by question number variable),
  /// the new question will be added into the [_questions] list. Otherwise, do nothing.
  void checkAddQuestion(TFQuestion newQuestion) {
    // check if the question with the new questions' question number exists.
    var questionAlreadyExists = _questions.where(
      (question) => newQuestion == question,
    );

    if (questionAlreadyExists.isEmpty) {
      _questions.add(newQuestion);
    }

    notifyListeners();
  }

  List<TFQuestion> get questions => _questions;
}

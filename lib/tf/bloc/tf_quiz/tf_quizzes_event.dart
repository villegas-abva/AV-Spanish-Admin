part of 'tf_quizzes_bloc.dart';

abstract class TFQuizzesEvent extends Equatable {
  const TFQuizzesEvent();

  @override
  List<Object?> get props => [];
}

class FetchQuizzes extends TFQuizzesEvent {}

class AddTFQuiz extends TFQuizzesEvent {
  const AddTFQuiz({required this.quiz});

  final TFQuiz quiz;

  @override
  List<Object?> get props => [quiz];
}

class EditTFQuiz extends TFQuizzesEvent {
  const EditTFQuiz({required this.quiz});

  final TFQuiz quiz;

  @override
  List<Object?> get props => [quiz];
}

class DeleteTFQuiz extends TFQuizzesEvent {
  const DeleteTFQuiz({required this.quiz});

  final TFQuiz quiz;

  @override
  List<Object?> get props => [quiz];
}

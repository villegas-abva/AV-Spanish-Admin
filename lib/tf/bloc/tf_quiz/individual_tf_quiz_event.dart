part of 'individual_tf_quiz_bloc.dart';

abstract class IndividualTFQuizEvent extends Equatable {
  const IndividualTFQuizEvent();
}

class AddTFQuizEvent extends IndividualTFQuizEvent {
  const AddTFQuizEvent(
    this.quiz,
  );

  final TFQuiz quiz;

  @override
  List<Object?> get props => [quiz];
}

class DeleteTFQuizEvent extends IndividualTFQuizEvent {
  const DeleteTFQuizEvent(this.quiz);

  final TFQuiz quiz;

  @override
  List<Object?> get props => [quiz];
}

class EditTFQuizEvent extends IndividualTFQuizEvent {
  const EditTFQuizEvent(this.quiz);

  final TFQuiz quiz;

  @override
  List<Object?> get props => [quiz];
}

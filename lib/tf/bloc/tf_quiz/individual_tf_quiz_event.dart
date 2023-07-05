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
  const DeleteTFQuizEvent();

  @override
  List<Object?> get props => [];
}

class EditTFQuizEvent extends IndividualTFQuizEvent {
  const EditTFQuizEvent();

  @override
  List<Object?> get props => [];
}

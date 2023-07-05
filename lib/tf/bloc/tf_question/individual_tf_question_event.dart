part of 'individual_tf_question_bloc.dart';

// TODO: edit with CRUD operations...
abstract class IndividualTFQuestionEvent extends Equatable {
  const IndividualTFQuestionEvent();

  @override
  List<Object?> get props => [];
}

class FetchQuestion extends IndividualTFQuestionEvent {
  const FetchQuestion({required this.quizId});

  final String quizId;

  @override
  List<Object?> get props => [quizId];
}

class AddQuestion extends IndividualTFQuestionEvent {
  const AddQuestion({
    required this.question,
    required this.quizId,
  });

  final TFQuestion question;
  final String quizId;

  @override
  List<Object?> get props => [
        question,
        quizId,
      ];
}

class EditQuestion extends IndividualTFQuestionEvent {
  const EditQuestion({
    required this.question,
    required this.quizId,
  });

  final TFQuestion question;
  final String quizId;

  @override
  List<Object?> get props => [
        question,
        quizId,
      ];
}

class DeleteQuestion extends IndividualTFQuestionEvent {
  const DeleteQuestion({
    required this.quizId,
    required this.question,
  });

  final TFQuestion question;
  final String quizId;
  @override
  List<Object?> get props => [
        question,
        quizId,
      ];
}

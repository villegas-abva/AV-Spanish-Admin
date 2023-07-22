part of 'individual_tf_question_bloc.dart';

// TODO: edit with CRUD operations...
abstract class IndividualTFQuestionEvent extends Equatable {
  const IndividualTFQuestionEvent();

  @override
  List<Object?> get props => [];
}

class FetchQuestionEvent extends IndividualTFQuestionEvent {
  const FetchQuestionEvent({required this.quizId});

  final String quizId;

  @override
  List<Object?> get props => [quizId];
}

class AddQuestionEvent extends IndividualTFQuestionEvent {
  const AddQuestionEvent({
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

class EditQuestionEvent extends IndividualTFQuestionEvent {
  const EditQuestionEvent({
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

class DeleteQuestionEvent extends IndividualTFQuestionEvent {
  const DeleteQuestionEvent({
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

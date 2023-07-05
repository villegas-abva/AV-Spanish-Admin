part of 'tf_questions_bloc.dart';

abstract class TFQuestionsEvent extends Equatable {
  const TFQuestionsEvent();

  @override
  List<Object?> get props => [];
}

class FetchQuestions extends TFQuestionsEvent {
  const FetchQuestions({required this.quizId});

  final String quizId;

  @override
  List<Object?> get props => [quizId];
}

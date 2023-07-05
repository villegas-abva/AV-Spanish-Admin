part of 'tf_questions_bloc.dart';

abstract class TFQuestionsState extends Equatable {
  const TFQuestionsState();

  @override
  List<Object?> get props => [];
}

class InitialTFQuestionsState extends TFQuestionsState {}

class LoadingTFQuestionsState extends TFQuestionsState {}

class LoadedTFQuestionsState extends TFQuestionsState {
  const LoadedTFQuestionsState({required this.questions});

  final List<TFQuestion> questions;

  @override
  List<Object?> get props => [questions];
}

class ErrorTFQuestionsState extends TFQuestionsState {
  const ErrorTFQuestionsState(this.error);

  final AppException error;

  @override
  List<Object?> get props => [error];
}

part of 'individual_tf_question_bloc.dart';

abstract class IndividualTFQuestionState extends Equatable {
  const IndividualTFQuestionState();

  @override
  List<Object?> get props => [];
}

class InitialTFQuestionState extends IndividualTFQuestionState {}

class LoadingTFQuestionState extends IndividualTFQuestionState {}

class LoadedTFQuestionState extends IndividualTFQuestionState {
  const LoadedTFQuestionState({required this.questions});

  final List<TFQuestion> questions;

  @override
  List<Object?> get props => [questions];
}

class SuccessTFQuestionState extends IndividualTFQuestionState {}

class ErrorTFQuestionState extends IndividualTFQuestionState {
  const ErrorTFQuestionState(this.error);

  final AppException error;

  @override
  List<Object?> get props => [error];
}

part of 'tf_quizzes_bloc.dart';

abstract class TfQuizzesState extends Equatable {
  const TfQuizzesState();

  @override
  List<Object?> get props => [];
}

class InitialTFQuizzesState extends TfQuizzesState {}

class LoadingTFQuizzesState extends TfQuizzesState {}

class LoadedTFQuizzesState extends TfQuizzesState {
  const LoadedTFQuizzesState({required this.quizzes});

  final List<TFQuiz> quizzes;

  @override
  List<Object?> get props => [quizzes];
}

class ErrorTFQuizzesState extends TfQuizzesState {
  const ErrorTFQuizzesState(this.error);

  final AppException error;

  @override
  List<Object> get props => [error];
}

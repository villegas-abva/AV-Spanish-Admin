part of 'individual_tf_quiz_bloc.dart';

abstract class IndividualTFQuizState extends Equatable {
  const IndividualTFQuizState();
}

class InitialTFQuizState extends IndividualTFQuizState {
  @override
  List<Object?> get props => const [];
}

class LoadingTFQuizState extends IndividualTFQuizState {
  const LoadingTFQuizState();

  @override
  List<Object?> get props => [];
}

class SuccessTFQuizState extends IndividualTFQuizState {
  const SuccessTFQuizState();

  @override
  List<Object?> get props => [];
}

class ErrorTFQuizState extends IndividualTFQuizState {
  const ErrorTFQuizState();

  @override
  List<Object?> get props => [];
}

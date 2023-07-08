import 'package:av_spanish_admin/services/models/models.dart';
import 'package:av_spanish_admin/services/repository/quiz_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'individual_tf_quiz_event.dart';
part 'individual_tf_quiz_state.dart';

class IndividualTFQuizBloc
    extends Bloc<IndividualTFQuizEvent, IndividualTFQuizState> {
  IndividualTFQuizBloc(
    this.quizRepository,
  ) : super(InitialTFQuizState()) {
    on<AddTFQuizEvent>(
      _addQuiz,
      transformer: droppable(),
    );
    on<EditTFQuizEvent>(
      _editQuiz,
      transformer: droppable(),
    );
    on<DeleteTFQuizEvent>(
      _deleteQuiz,
      transformer: droppable(),
    );
  }

  final QuizRepository quizRepository;

  Future<void> _addQuiz(
    AddTFQuizEvent event,
    Emitter<IndividualTFQuizState> emit,
  ) async {
    emit(const LoadingTFQuizState());
    try {
      quizRepository.addTFQuiz(event.quiz);
      emit(
        const SuccessTFQuizState(),
      );
    } catch (e) {
      emit(
        const ErrorTFQuizState(),
      );
    }
  }

  Future<void> _editQuiz(
    EditTFQuizEvent event,
    Emitter<IndividualTFQuizState> emit,
  ) async {
    emit(const LoadingTFQuizState());
    try {
      quizRepository.editTFQuiz(event.quiz);
      emit(
        const SuccessTFQuizState(),
      );
    } catch (e) {
      emit(
        const ErrorTFQuizState(),
      );
    }
  }

  Future<void> _deleteQuiz(
    DeleteTFQuizEvent event,
    Emitter<IndividualTFQuizState> emit,
  ) async {
    emit(const LoadingTFQuizState());
    try {
      quizRepository.deleteTFQuiz(event.quiz);
      emit(
        const SuccessTFQuizState(),
      );
    } catch (e) {
      emit(
        const ErrorTFQuizState(),
      );
    }
  }
}

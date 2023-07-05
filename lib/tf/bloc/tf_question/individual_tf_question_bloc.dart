import 'package:av_spanish_admin/services/app_exception.dart';
import 'package:av_spanish_admin/services/models/models.dart';
import 'package:av_spanish_admin/services/repository/quiz_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'individual_tf_question_event.dart';
part 'individual_tf_question_state.dart';

class IndividualTFQuestionBloc
    extends Bloc<IndividualTFQuestionEvent, IndividualTFQuestionState> {
  IndividualTFQuestionBloc(this.repo) : super(InitialTFQuestionState()) {
    on<FetchQuestion>(_fetchTFQuestions);
    on<AddQuestion>(_addQuestion);
    on<EditQuestion>(_editQuestion);
    on<DeleteQuestion>(_deleteQuestion);
  }

  final QuizRepository repo;

  Future<void> _fetchTFQuestions(
    FetchQuestion event,
    Emitter<IndividualTFQuestionState> emit,
  ) async {
    emit(LoadingTFQuestionState());
    try {
      final questions = await repo.getTFQuestionsFromQuiz(event.quizId);
      emit(LoadedTFQuestionState(questions: questions));
    } catch (e) {
      emit(ErrorTFQuestionState(AppException.fromObject(e)));
    }
  }

  // TODO: implement
  Future<void> _addQuestion(
    AddQuestion event,
    Emitter<IndividualTFQuestionState> emit,
  ) async {
    emit(LoadingTFQuestionState());
    try {
      // await repo.addT(
      //   quizId: event.quizId,
      //   question: event.question,
      // );
      emit(SuccessTFQuestionState());
    } catch (e) {
      emit(ErrorTFQuestionState(AppException.fromObject(e)));
    }
  }

  Future<void> _editQuestion(
    EditQuestion event,
    Emitter<IndividualTFQuestionState> emit,
  ) async {
    try {
      await repo.updateTFQuestion(
        quizId: event.quizId,
        question: event.question,
      );
      emit(SuccessTFQuestionState());
    } catch (e) {
      emit(ErrorTFQuestionState(AppException.fromObject(e)));
    }
  }

  Future<void> _deleteQuestion(
    DeleteQuestion event,
    Emitter<IndividualTFQuestionState> emit,
  ) async {
    try {
      await repo.deleteTFQuestion(
        quizId: event.quizId,
        question: event.question,
      );
      emit(SuccessTFQuestionState());
    } catch (e) {
      emit(ErrorTFQuestionState(AppException.fromObject(e)));
    }
  }
}

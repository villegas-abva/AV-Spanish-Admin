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
    on<FetchQuestionEvent>(_fetchTFQuestions);
    on<AddQuestionEvent>(_addQuestion);
    on<EditQuestionEvent>(_editQuestion);
    on<DeleteQuestionEvent>(_deleteQuestion);
  }

  final QuizRepository repo;

  Future<void> _fetchTFQuestions(
    FetchQuestionEvent event,
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
    AddQuestionEvent event,
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
    EditQuestionEvent event,
    Emitter<IndividualTFQuestionState> emit,
  ) async {
    try {
      await repo.editTFQuestion(
        quizId: event.quizId,
        question: event.question,
      );
      emit(SuccessTFQuestionState());
    } catch (e) {
      emit(ErrorTFQuestionState(AppException.fromObject(e)));
    }
  }

  Future<void> _deleteQuestion(
    DeleteQuestionEvent event,
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

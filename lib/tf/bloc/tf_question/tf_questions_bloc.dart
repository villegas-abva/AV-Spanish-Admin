import 'package:av_spanish_admin/services/app_exception.dart';
import 'package:av_spanish_admin/services/models/models.dart';
import 'package:av_spanish_admin/services/repository/quiz_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tf_questions_event.dart';
part 'tf_questions_state.dart';

class TFQuestionsBloc extends Bloc<TFQuestionsEvent, TFQuestionsState> {
  TFQuestionsBloc(this.repo) : super(InitialTFQuestionsState()) {
    on<FetchQuestions>(_fetchTFQuestions);
  }

  final QuizRepository repo;

  Future<void> _fetchTFQuestions(
    FetchQuestions event,
    Emitter<TFQuestionsState> emit,
  ) async {
    emit(LoadingTFQuestionsState());
    try {
      final questions = await repo.getTFQuestionsFromQuiz(event.quizId);
      emit(LoadedTFQuestionsState(questions: questions));
    } catch (e) {
      emit(ErrorTFQuestionsState(AppException.fromObject(e)));
    }
  }
}

import 'package:av_spanish_admin/services/app_exception.dart';
import 'package:av_spanish_admin/services/models/models.dart';
import 'package:av_spanish_admin/services/repository/quiz_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tf_quizzes_event.dart';
part 'tf_quizzes_state.dart';

class TFQuizzesBloc extends Bloc<TFQuizzesEvent, TfQuizzesState> {
  TFQuizzesBloc(this.repo) : super(InitialTFQuizzesState()) {
    on<FetchQuizzes>(_fetchTFQuizzes);
  }

  final QuizRepository repo;

  Future<void> _fetchTFQuizzes(
    FetchQuizzes event,
    Emitter<TfQuizzesState> emit,
  ) async {
    emit(LoadingTFQuizzesState());
    try {
      final quizzes = await repo.getTFQuizzes();
      emit(LoadedTFQuizzesState(quizzes: quizzes));
    } catch (e) {
      emit(ErrorTFQuizzesState(AppException.fromObject(e)));
    }
  }
}

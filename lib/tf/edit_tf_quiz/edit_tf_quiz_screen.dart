import 'package:av_spanish_admin/services/models/models.dart';
import 'package:av_spanish_admin/tf/bloc/tf_question/tf_questions_bloc.dart';
import 'package:av_spanish_admin/tf/bloc/tf_quiz/individual_tf_quiz_bloc.dart';
import 'package:av_spanish_admin/tf/edit_tf_quiz/widgets/edit_tf_question.field.dart';
import 'package:av_spanish_admin/tf/edit_tf_quiz/widgets/edit_tf_quiz_field.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTFQuizScreen extends StatefulWidget {
  const EditTFQuizScreen({
    required this.quiz,
    super.key,
  });

  final TFQuiz quiz;

  @override
  State<EditTFQuizScreen> createState() => _EditTFQuizScreenState();
}

class _EditTFQuizScreenState extends State<EditTFQuizScreen> {
  final TextEditingController _quizTitleController = TextEditingController();
  final TextEditingController _quizUrlController = TextEditingController();

  /// Initialize controller values with Quiz values
  @override
  void initState() {
    super.initState();
    _quizTitleController.text = widget.quiz.title;
    _quizUrlController.text = widget.quiz.url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit TF Quiz'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              // Quiz fields
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AppText.headline1('Quiz fields'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: EditTFQuizField(
                  fieldName: 'Quiz title',
                  controller: _quizTitleController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: EditTFQuizField(
                  fieldName: 'Quiz url',
                  controller: _quizUrlController,
                ),
              ),
              // TODO: implement Spacer
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: AppButton(
                  onPressed: () {
                    context.read<IndividualTFQuizBloc>().add(
                          EditTFQuizEvent(
                            widget.quiz.copyWith(
                              title: _quizTitleController.text,
                              url: _quizUrlController.text,
                            ),
                          ),
                        );
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: AppText.button1('Edit quiz fields'),
                  ),
                ),
              ),
              // Questions fields
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: AppText.headline1('Quiz Questions'),
              ),
              BlocBuilder<TFQuestionsBloc, TFQuestionsState>(
                builder: (context, state) {
                  if (state is LoadingTFQuestionsState) {
                    return const CircularProgressIndicator();
                  }
                  if (state is LoadedTFQuestionsState) {
                    final questions = state.questions;

                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: questions.length,
                      itemBuilder: (context, index) {
                        final question = questions[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: EditTFQuestionField(
                            question: question,
                            quizId: widget.quiz.id,
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: AppButton(
                  onPressed: () {
                    context.read<IndividualTFQuizBloc>().add(
                          EditTFQuizEvent(
                            widget.quiz.copyWith(
                              title: _quizTitleController.text,
                              url: _quizUrlController.text,
                            ),
                          ),
                        );
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: AppText.button1('Edit questions'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

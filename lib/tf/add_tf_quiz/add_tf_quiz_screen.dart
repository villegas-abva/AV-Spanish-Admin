import 'package:av_spanish_admin/services/models/models.dart';
import 'package:av_spanish_admin/tf/add_tf_quiz/widgets/add_tf_quiz_questions_modal.dart';
import 'package:av_spanish_admin/tf/add_tf_quiz_questions_state_notifier.dart';
import 'package:av_spanish_admin/tf/bloc/tf_quiz/individual_tf_quiz_bloc.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/app_button.dart';
import 'package:av_spanish_admin/widgets/app_card_widget.dart';
import 'package:av_spanish_admin/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTFQuizScreen extends StatefulWidget {
  const AddTFQuizScreen({super.key});

  @override
  State<AddTFQuizScreen> createState() => _AddTFQuizScreenState();
}

class _AddTFQuizScreenState extends State<AddTFQuizScreen> {
  late List<TFQuestion> quizQuestions;

  final TextEditingController _quizTitleController = TextEditingController();
  final TextEditingController _quizUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    quizQuestions =
        Provider.of<AddTFQuizQuestionsStateNotifier>(context, listen: false)
            .questions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add TF Quiz')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AppText.headline1('Quiz Fields'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AppField(
                  fieldName: 'Quiz title',
                  controller: _quizTitleController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: AppField(
                  fieldName: 'Quiz url',
                  controller: _quizUrlController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AppText.headline1('Questions'),
              ),
              Consumer(builder: (
                context,
                AddTFQuizQuestionsStateNotifier state,
                child,
              ) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: quizQuestions.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final question = quizQuestions[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: AppCardWidget(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: AppText.body1(
                              question.question,
                            ),
                          ),
                          AppText.body1(
                            question.answer,
                          ),
                        ],
                      ),
                    );
                  },
                );
              })
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppButton(
            child: AppText.button1('Add question'),
            onPressed: () {
              _showAddQuestionsBottomSheet(
                context: context,
                questionNumber: (quizQuestions.length + 1).toString(),
              );
            },
          ),
          AppButton(
            backgroundColor: Colors.red,
            child: AppText.button1('Add quiz'),
            onPressed: () {
              context.read<IndividualTFQuizBloc>().add(
                    AddTFQuizEvent(
                      TFQuiz(
                        id: _quizTitleController.text,
                        title: _quizTitleController.text,
                        url: _quizUrlController.text,
                        questions: quizQuestions,
                        numberOfQuestions: quizQuestions.length,
                      ),
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }

  void _showAddQuestionsBottomSheet({
    required BuildContext context,
    required String questionNumber,
  }) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) {
        return AddTFQuizQuestionsModal(
          onAddQuestion: (newQuestion) {
            checkAddQuestion(
              questionList: quizQuestions,
              question: newQuestion,
            );
          },
          questionNumber: questionNumber,
        );
      },
    );
  }

  /// Check whether a specific true / false question was added already in this quiz,
  /// by checking at this question's [questionNumber] field.
  ///
  /// If it hasn't been added yet, it'll add it into the list of questions inside [TrueFalseCurrentQuestionsState].
  void checkAddQuestion({
    required List<TFQuestion> questionList,
    required TFQuestion question,
  }) {
    Provider.of<AddTFQuizQuestionsStateNotifier>(context, listen: false)
        .checkAddQuestion(question);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Question added',
        ),
        duration: Duration(seconds: 1),
      ),
    );
  }
}

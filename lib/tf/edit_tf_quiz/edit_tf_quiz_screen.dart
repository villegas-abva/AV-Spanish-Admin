import 'package:av_spanish_admin/services/models/models.dart';
import 'package:av_spanish_admin/tf/bloc/tf_quiz/individual_tf_quiz_bloc.dart';
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
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AppText.headline1('This quiz'),
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
              AppButton(
                onPressed: () {
                  context
                      .read<IndividualTFQuizBloc>()
                      .add(EditTFQuizEvent(widget.quiz.copyWith(
                        title: _quizTitleController.text,
                        url: _quizUrlController.text,
                      )));
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: AppText.button1('Edit quiz fields'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

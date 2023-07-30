import 'package:av_spanish_admin/services/models/tf/tf_question.dart';
import 'package:av_spanish_admin/tf/bloc/tf_question/individual_tf_question_bloc.dart';
import 'package:av_spanish_admin/tf/edit_tf_quiz/widgets/edit_tf_quiz_field.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/app_button.dart';
import 'package:av_spanish_admin/widgets/app_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTFQuestionField extends StatefulWidget {
  const EditTFQuestionField({
    required this.question,
    super.key,
    required this.quizId,
  });

  final String quizId;
  final TFQuestion question;

  @override
  State<EditTFQuestionField> createState() => _EditTFQuestionFieldState();
}

class _EditTFQuestionFieldState extends State<EditTFQuestionField> {
  bool isExpanded = false;

  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();
  final TextEditingController _startTimeMinuteController =
      TextEditingController();
  final TextEditingController _startTimeSecondController =
      TextEditingController();
  final TextEditingController _endTimeMinuteController =
      TextEditingController();
  final TextEditingController _endTimeSecondController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _questionController.text = widget.question.question;
    _answerController.text = widget.question.answer;
    _startTimeMinuteController.text = widget.question.startTimeMinute;
    _startTimeSecondController.text = widget.question.startTimeSecond;
    _endTimeMinuteController.text = widget.question.endTimeMinute;
    _endTimeSecondController.text = widget.question.endTimeSecond;
  }

  String get _question => _questionController.text;
  String get _answer => _answerController.text;
  String get _startTimeMinute => _startTimeMinuteController.text;
  String get _startTimeSecond => _startTimeSecondController.text;
  String get _endTimeMinute => _endTimeMinuteController.text;
  String get _endTimeSecond => _endTimeSecondController.text;

  @override
  Widget build(BuildContext context) {
    return AppCardWidget(
      children: [
        ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: IconButton(
                      icon: const Icon(Icons.person),
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                    )),
              ],
            ),
            if (!isExpanded) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: AppText.body1(
                  widget.question.question,
                ),
              ),
              AppText.body1(
                widget.question.answer,
              ),
            ],
            if (isExpanded) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: EditTFQuizField(
                  controller: _questionController,
                  fieldName: 'Question',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: EditTFQuizField(
                  controller: _answerController,
                  fieldName: 'Answer',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: EditTFQuizField(
                  controller: _startTimeMinuteController,
                  fieldName: 'Start time minute',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: EditTFQuizField(
                  controller: _startTimeSecondController,
                  fieldName: 'Start time second',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: EditTFQuizField(
                  controller: _endTimeMinuteController,
                  fieldName: 'End time minute',
                ),
              ),
              EditTFQuizField(
                controller: _endTimeSecondController,
                fieldName: 'End time second',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: AppButton(
                  onPressed: () {
                    context.read<IndividualTFQuestionBloc>().add(
                          EditQuestionEvent(
                            quizId: widget.quizId,
                            question: TFQuestion(
                              id: widget.question.id,
                              question: _question,
                              answer: _answer,
                              startTimeMinute: _startTimeMinute,
                              startTimeSecond: _startTimeSecond,
                              endTimeMinute: _endTimeMinute,
                              endTimeSecond: _endTimeSecond,
                              questionNumber: widget.question.questionNumber,
                            ),
                          ),
                        );
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: AppText.button1('Edit question'),
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}

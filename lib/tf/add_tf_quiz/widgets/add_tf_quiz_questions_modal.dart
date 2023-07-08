import 'package:av_spanish_admin/services/models/models.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/app_button.dart';
import 'package:av_spanish_admin/widgets/app_field.dart';
import 'package:flutter/material.dart';

class AddTFQuizQuestionsModal extends StatefulWidget {
  const AddTFQuizQuestionsModal({
    required this.onAddQuestion,
    required this.questionNumber,
    super.key,
  });

  final void Function(TFQuestion) onAddQuestion;
  final String questionNumber;

  @override
  State<AddTFQuizQuestionsModal> createState() =>
      _AddTFQuizQuestionsModalState();
}

class _AddTFQuizQuestionsModalState extends State<AddTFQuizQuestionsModal> {
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
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.83,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppField(
              fieldName: 'Question',
              controller: _questionController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppField(
              fieldName: 'Answer',
              controller: _answerController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppField(
              fieldName: 'Start time minute',
              controller: _startTimeMinuteController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppField(
              fieldName: 'Start time second',
              controller: _startTimeSecondController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppField(
              fieldName: 'End time minute',
              controller: _endTimeMinuteController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppField(
              fieldName: 'End time second',
              controller: _endTimeSecondController,
            ),
          ),
          const Spacer(),
          AppButton(
            onPressed: () {
              widget.onAddQuestion(
                TFQuestion(
                  id: widget.questionNumber,
                  questionNumber: widget.questionNumber,
                  question: _questionController.text,
                  answer: _answerController.text,
                  startTimeSecond: _startTimeSecondController.text,
                  startTimeMinute: _startTimeMinuteController.text,
                  endTimeSecond: _endTimeSecondController.text,
                  endTimeMinute: _endTimeMinuteController.text,
                ),
              );
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: AppText.button1('Add question'),
            ),
          )
        ],
      ),
    );
  }
}

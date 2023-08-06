import 'package:av_spanish_admin/services/models/tf/tf_quiz.dart';
import 'package:av_spanish_admin/tf/individual_tf_quiz/widgets/fields/individual_tf_quiz_edit_fields_cta.dart';
import 'package:av_spanish_admin/tf/individual_tf_quiz/widgets/individual_tf_quiz_field_card.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:flutter/material.dart';

const Duration _duration = Duration(milliseconds: 500);

class IndividualTFQuizFieldsWidget extends StatefulWidget {
  const IndividualTFQuizFieldsWidget({
    required this.quiz,
    super.key,
  });

  final TFQuiz quiz;

  @override
  State<IndividualTFQuizFieldsWidget> createState() =>
      _IndividualTFQuizFieldsWidgetState();
}

class _IndividualTFQuizFieldsWidgetState
    extends State<IndividualTFQuizFieldsWidget> {
  /// Whether the fields can be edited or not.
  bool _fieldsCanBeEdited = false;
  late TextEditingController _titleController;
  late TextEditingController _urlController;

  @override
  void initState() {
    _titleController = TextEditingController()..text = widget.quiz.title;
    _urlController = TextEditingController()..text = widget.quiz.url;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.headline1('Quiz Fields'),
              IndividualTFQuizEditFieldsCTA(
                fieldsCanBeEdited: _fieldsCanBeEdited,
                updateFieldsState: _updateFieldsCTAState,
                duration: _duration,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: IndividualTFQuizFieldCard(
            header: 'Title',
            subheader: widget.quiz.title,
            fieldsCanBeEdited: _fieldsCanBeEdited,
            duration: _duration,
            controller: _titleController,
          ),
        ),
        IndividualTFQuizFieldCard(
          header: 'Url',
          subheader: widget.quiz.url,
          fieldsCanBeEdited: _fieldsCanBeEdited,
          duration: _duration,
          controller: _urlController,
        ),
      ],
    );
  }

  void _updateFieldsCTAState() {
    setState(() {
      _fieldsCanBeEdited = !_fieldsCanBeEdited;
    });
  }
}

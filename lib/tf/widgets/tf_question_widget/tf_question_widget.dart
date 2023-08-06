import 'package:av_spanish_admin/services/models/tf/tf_question.dart';
import 'package:av_spanish_admin/services/models/tf/tf_quiz.dart';
import 'package:av_spanish_admin/tf/individual_tf_quiz_screen.dart';
import 'package:av_spanish_admin/tf/widgets/tf_question_widget/tf_question_body_widget.dart';
import 'package:av_spanish_admin/tf/widgets/tf_question_widget/tf_question_floating_widget.dart';
import 'package:flutter/material.dart';

class TFQuestionWidget extends StatelessWidget {
  /// An individual [TFQuiz] card, which on tapped navigates to [IndividualTFQuizScreen].
  const TFQuestionWidget({
    required this.question,
    super.key,
  });

  final TFQuestion question;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => IndividualTFQuizScreen(
      //       quiz: quiz,
      //     ),
      //   ),
      // ),
      child: Stack(
        children: [
          TFQuestionBodyWidget(question: question),
          TFQuestionFloatingWidget(isAnswerTrue: question.answer == 'true'),
        ],
      ),
    );
  }
}

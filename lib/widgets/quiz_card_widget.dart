import 'package:av_spanish_admin/services/models/models.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/app_card_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget({
    required this.quiz,
    super.key,
  });

  final TFQuiz quiz;

  @override
  Widget build(BuildContext context) {
    return AppCardWidget(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AppText(
            quiz.title,
            style: AppText.body1Style.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: RichText(
            text: TextSpan(
              text: quiz.numberOfQuestions.toString(),
              style: AppText.headline1Style,
              children: [
                TextSpan(text: ' questions', style: AppText.body2Style),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

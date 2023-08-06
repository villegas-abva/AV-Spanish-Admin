import 'package:av_spanish_admin/services/models/tf/tf_quiz.dart';
import 'package:av_spanish_admin/tf/individual_tf_quiz_screen.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/app_card_widget.dart';
import 'package:flutter/material.dart';

class TFQuizWidget extends StatelessWidget {
  /// An individual [TFQuiz] card, which on tapped navigates to [IndividualTFQuizScreen].
  const TFQuizWidget({
    required this.quiz,
    super.key,
  });

  final TFQuiz quiz;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IndividualTFQuizScreen(
                  quiz: quiz,
                ),
              ),
            ),
        child: SizedBox(
          width: double.infinity,
          child: AppCardWidget(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: AppText(
                  quiz.title,
                  style: AppText.body1Style
                      .copyWith(fontSize: 17, fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: AppText(
                  '${quiz.numberOfQuestions} questions',
                  style: AppText.body1Style.copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
        ));
  }
}

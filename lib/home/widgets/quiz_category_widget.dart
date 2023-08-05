import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/app_card_widget.dart';
import 'package:flutter/material.dart';

class QuizCategoryWidget extends StatelessWidget {
  /// A Quiz category card inside [HomeScreen].
  const QuizCategoryWidget({
    required this.category,
    required this.numberOfQuizzes,
    super.key,
  });

  final String category;
  final int numberOfQuizzes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: AppCardWidget(
        borderRadius: 4,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: AppText.body1(
              category,
              textAlign: TextAlign.center,
            ),
          ),
          AppText.bodySmall('$numberOfQuizzes quizzes'),
        ],
      ),
    );
  }
}

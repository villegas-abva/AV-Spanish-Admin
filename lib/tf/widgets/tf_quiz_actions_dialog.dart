import 'package:av_spanish_admin/services/models/models.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/app_divider.dart';
import 'package:flutter/material.dart';

class TFQuizActionsDialog extends StatelessWidget {
  const TFQuizActionsDialog({
    required this.quiz,
    required this.onDeleteQuiz,
    required this.onNavigateToEditQuizScreen,
    super.key,
  });

  final TFQuiz quiz;
  final void Function() onDeleteQuiz;
  final void Function() onNavigateToEditQuizScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: GestureDetector(
              onTap: () {
                // Navigator.pop(context);
                onNavigateToEditQuizScreen();
              },
              child: AppText.body1('Edit quiz fields'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: AppDivider(
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: onDeleteQuiz,
            child: AppText.body1('Delete quiz'),
          ),
        ],
      ),
    );
  }
}

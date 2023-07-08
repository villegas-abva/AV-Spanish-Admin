import 'package:av_spanish_admin/services/models/models.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/app_divider.dart';
import 'package:flutter/material.dart';

class TFQuizActionsDialog extends StatelessWidget {
  const TFQuizActionsDialog({
    required this.quiz,
    required this.onDeleteQuiz,
    super.key,
  });

  final TFQuiz quiz;
  final void Function() onDeleteQuiz;

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
            child: AppText.body1('Edit quiz fields'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: GestureDetector(
              // TODO: navigate to edit quiz screen
              onTap: () {},
              child: const AppDivider(
                color: Colors.black,
              ),
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

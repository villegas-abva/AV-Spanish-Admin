import 'package:av_spanish_admin/services/models/models.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/app_card_widget.dart';
import 'package:flutter/material.dart';

class TFQuestionBodyWidget extends StatelessWidget {
  const TFQuestionBodyWidget({
    required this.question,
    super.key,
  });

  final TFQuestion question;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AppCardWidget(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: AppText(
              question.question,
              style: AppText.body1Style
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

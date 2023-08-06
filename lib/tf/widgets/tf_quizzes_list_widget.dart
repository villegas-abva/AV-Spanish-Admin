import 'package:av_spanish_admin/services/models/models.dart';
import 'package:av_spanish_admin/tf/widgets/tf_quiz_widget/tf_quiz_widget.dart';
import 'package:flutter/material.dart';

class TFQuizzesListWidget extends StatelessWidget {
  /// A list of [TFQuizWidget].
  const TFQuizzesListWidget({
    required this.quizzes,
    super.key,
  });

  final List<TFQuiz> quizzes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: quizzes.length,
      itemBuilder: (context, index) {
        final quiz = quizzes[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: TFQuizWidget(
            quiz: quiz,
          ),
        );
      },
    );
  }
}

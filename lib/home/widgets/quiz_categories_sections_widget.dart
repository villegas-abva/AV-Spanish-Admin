import 'package:av_spanish_admin/home/widgets/quiz_category_widget.dart';
import 'package:av_spanish_admin/mc/mc_quizzes_screen.dart';
import 'package:av_spanish_admin/services/models/tf/tf_quiz.dart';
import 'package:av_spanish_admin/tf/true_false_quizzes_screen.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:flutter/material.dart';

class QuizCategoriesSectionWidget extends StatelessWidget {
  /// Displays a header and the [TrueFalse] and [MultipleChoice] categories inside [HomeScreen].
  const QuizCategoriesSectionWidget({
    required this.tfQuizzes,
    super.key,
  });

  final List<TFQuiz> tfQuizzes;
// TODO: pass MC Quizzes once implemented

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          child: AppText.headline1('Quiz categories'),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TrueFalseQuizzesScreen()),
                  );
                },
                child: QuizCategoryWidget(
                  category: 'True False',
                  // TODO: update this value from database
                  numberOfQuizzes: tfQuizzes.length,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MCQuizzesScreen()),
                );
              },
              child: const QuizCategoryWidget(
                category: 'Multiple Choice',
                numberOfQuizzes: 5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

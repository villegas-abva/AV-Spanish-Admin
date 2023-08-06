import 'package:av_spanish_admin/services/models/tf/tf_quiz.dart';
import 'package:av_spanish_admin/tf/widgets/tf_quiz_screen_app_bar.dart';
import 'package:av_spanish_admin/tf/widgets/tf_quizzes_list_widget.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:flutter/material.dart';

class TrueFalseQuizzesScreen extends StatelessWidget {
  /// Displays a list of [TFQuiz]s.
  const TrueFalseQuizzesScreen({
    required this.quizzes,
    super.key,
  });

  final List<TFQuiz> quizzes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 60, bottom: 20),
                child: TFQuizScreenAppBar(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: AppText(
                  'True False Quizzes',
                  style: AppText.headline1Style.copyWith(fontSize: 28),
                ),
              ),
              TFQuizzesListWidget(quizzes: quizzes),
            ],
          ),
        ),
      ),
    );
  }
}

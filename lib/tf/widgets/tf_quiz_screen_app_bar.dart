import 'package:av_spanish_admin/tf/add_tf_quiz/add_true_false_quiz_screen.dart';
import 'package:av_spanish_admin/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class TFQuizScreenAppBar extends StatelessWidget {
  const TFQuizScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      navigateTo: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddTrueFalseQuizScreen()),
      ),
    );
  }
}

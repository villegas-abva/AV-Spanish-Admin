import 'package:av_spanish_admin/mc/add_mc_quiz/add_mc_quiz_screen.dart';
import 'package:av_spanish_admin/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MCQuizScreenAppBar extends StatelessWidget {
  const MCQuizScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      navigateTo: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddMCQuizScreen()),
      ),
    );
  }
}

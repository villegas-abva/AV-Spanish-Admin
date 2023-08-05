import 'package:av_spanish_admin/mc/widgets/mc_quiz_screen_app_bar.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:flutter/material.dart';

class MCQuizzesScreen extends StatelessWidget {
  const MCQuizzesScreen({super.key});

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
                child: MCQuizScreenAppBar(),
              ),
              AppText(
                'Multiple Choice Quizzes',
                style: AppText.headline1Style.copyWith(fontSize: 28),
              )
            ],
          ),
        ),
      ),
    );
  }
}

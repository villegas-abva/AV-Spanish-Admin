import 'package:av_spanish_admin/home/widgets/quiz_category_tile.dart';
import 'package:av_spanish_admin/mc/add_mc_quiz/add_mc_quiz_screen.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:flutter/material.dart';

class AddQuizBottomSheetBodyWidget extends StatelessWidget {
  const AddQuizBottomSheetBodyWidget({
    required this.navigateToAddTFQuizScreen,
    super.key,
  });

  final void Function() navigateToAddTFQuizScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          'Add a quiz',
          style: AppText.headline1Style.copyWith(color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 12),
          child: QuizCategoryTile(
            text: 'Add True-False quiz',
            navigateTo: navigateToAddTFQuizScreen,
          ),
        ),
        QuizCategoryTile(
          text: 'Add Multiple Choice quiz',
          navigateTo: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AddMCQuizScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}

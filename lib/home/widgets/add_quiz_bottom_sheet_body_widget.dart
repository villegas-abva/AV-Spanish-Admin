import 'package:av_spanish_admin/home/widgets/quiz_category_tile.dart';
import 'package:av_spanish_admin/mc/add_mc_quiz/add_mc_quiz_screen.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/app_divider.dart';
import 'package:flutter/material.dart';

class AddQuizBottomSheetBodyWidget extends StatelessWidget {
  /// Has the add "True false" and "Multiple Choice" [QuizCategoryTile] option
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
          style: AppText.headline1Style.copyWith(color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: QuizCategoryTile(
            text: 'True-False quiz',
            navigateTo: navigateToAddTFQuizScreen,
            bottomPadding: 8,
          ),
        ),
        const AppDivider(
          color: Colors.black,
          width: double.infinity,
          height: 0,
          thickness: 0.6,
        ),
        QuizCategoryTile(
          text: 'Multiple Choice quiz',
          topPadding: 8,
          navigateTo: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddMCQuizScreen(),
              ),
            );
            Future.delayed(const Duration(seconds: 1))
                .then((value) => Navigator.pop(context));
          },
        ),
      ],
    );
  }
}

import 'package:av_spanish_admin/theme/theme.dart';
import 'package:flutter/material.dart';

class QuizCategoryTile extends StatelessWidget {
  const QuizCategoryTile({
    super.key,
    required this.text,
    required this.navigateTo,
    this.topPadding = 0,
    this.bottomPadding = 0,
  });

  final String text;
  final double topPadding, bottomPadding;
  final void Function() navigateTo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: navigateTo,
      child: Padding(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child: Row(
          children: [
            AppText(
              text,
              style: AppText.body1Style.copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

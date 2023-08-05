import 'package:av_spanish_admin/home/widgets/home_screen_leading_widget.dart';
import 'package:av_spanish_admin/widgets/add_quiz_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  /// A custom Widget that acts as an [AppBar], with actions like popping a screen and navigation.
  const CustomAppBar({
    required this.navigateTo,
    super.key,
  });

  final void Function() navigateTo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const HomeScreenLeadingWidget(),
        AddQuizIcon(navigateTo: navigateTo),
      ],
    );
  }
}

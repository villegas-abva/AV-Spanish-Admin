import 'package:av_spanish_admin/widgets/custom_app_bar/custom_app_bar_trailing_widget.dart.dart';
import 'package:av_spanish_admin/widgets/custom_app_bar/custom_app_bar_leading_widget.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  /// A custom Widget that acts as an [AppBar], with actions like popping a screen and navigation.
  const CustomAppBar({
    required this.navigateTo,
    super.key,
  });

  final void Function() navigateTo;

  // TODO: customize for other leading and trailing widgets

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomAppBarLeadingWidget(),
        CustomAppBarTrailingWidget(navigateTo: navigateTo),
      ],
    );
  }
}

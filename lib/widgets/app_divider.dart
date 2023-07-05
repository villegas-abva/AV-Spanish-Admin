import 'package:av_spanish_admin/theme/theme.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider(
      {super.key, this.color = AppColors.white, this.thickness = 1});

  final Color? color;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      color: color,
    );
  }
}

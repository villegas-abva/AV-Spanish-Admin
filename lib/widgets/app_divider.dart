import 'package:av_spanish_admin/theme/theme.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.color = AppColors.white,
    this.thickness = 1,
    this.width = 50,
    this.height = 0,
  });

  final Color? color;
  final double? thickness;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Divider(
        thickness: thickness,
        color: color,
        height: height,
      ),
    );
  }
}

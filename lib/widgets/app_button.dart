import 'package:av_spanish_admin/theme/theme.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.height = 50,
    this.borderRadius,
    this.backgroundColor = AppColors.darkYellow,
    this.borderSide,
    this.overlayColor,
  });

  final void Function()? onPressed;
  final Widget child;
  final double height;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final Color? overlayColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.white;
            }
            return backgroundColor ?? AppColors.darkYellow;
          },
        ),
        fixedSize: MaterialStateProperty.all(Size.fromHeight(
          height,
        )),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: borderSide ?? BorderSide.none,
            borderRadius: borderRadius ?? BorderRadius.circular(35),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

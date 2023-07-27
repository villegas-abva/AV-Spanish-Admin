import 'package:av_spanish_admin/widgets/app_divider.dart';
import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  /// A custom [BottomSheet] widget with a handler, and whose height is a percentage
  /// of the screen.
  const AppBottomSheet({
    required this.child,
    this.percentageOfScreenHeight = 0.93,
    this.handlerWidth = 40,
    this.topBorderRadius = 25,
    super.key,
  });

  final Widget child;
  final double percentageOfScreenHeight;
  final double handlerWidth;
  final double topBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * percentageOfScreenHeight,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(topBorderRadius),
          topLeft: Radius.circular(topBorderRadius),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: AppDivider(
                thickness: 3,
                color: Colors.white,
                width: handlerWidth,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: child,
          ),
        ],
      ),
    );
  }
}

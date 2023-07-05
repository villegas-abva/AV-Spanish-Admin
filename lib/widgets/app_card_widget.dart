import 'package:flutter/material.dart';

class AppCardWidget extends StatelessWidget {
  /// A reusable [Card] with custom styling (i.e elevation).
  const AppCardWidget({
    required this.children,
    this.borderRadius = 20,
    super.key,
  });
  final double borderRadius;
  final List<Widget> children;

  BorderRadius get bRadius => BorderRadius.circular(borderRadius);

  @override
  Widget build(BuildContext context) {
    // use Material to add elevation
    return Material(
      type: MaterialType.card,
      elevation: 4,
      borderRadius: bRadius,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(borderRadius: bRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}

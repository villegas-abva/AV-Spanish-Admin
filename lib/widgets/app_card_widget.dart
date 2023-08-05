import 'package:flutter/material.dart';

class AppCardWidget extends StatelessWidget {
  /// A reusable [Card] with custom styling (i.e elevation).
  const AppCardWidget({
    required this.children,
    this.borderRadius = 20,
    this.color = Colors.white,
    super.key,
  });
  final double borderRadius;
  final List<Widget> children;
  final Color color;

  BorderRadius get _radius => BorderRadius.circular(borderRadius);

  @override
  Widget build(BuildContext context) {
    // use Material to add elevation
    return Material(
      type: MaterialType.card,
      elevation: 4,
      borderRadius: _radius,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: _radius,
          color: color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}

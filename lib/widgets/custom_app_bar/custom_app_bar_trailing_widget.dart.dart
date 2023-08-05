import 'package:flutter/material.dart';

class CustomAppBarTrailingWidget extends StatelessWidget {
  const CustomAppBarTrailingWidget({
    super.key,
    required this.navigateTo,
  });

  final void Function() navigateTo;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: navigateTo,
      icon: const Icon(
        Icons.add_circle_outline_outlined,
        size: 25,
      ),
    );
  }
}

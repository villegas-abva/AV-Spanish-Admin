import 'package:flutter/material.dart';

class CustomAppBarLeadingWidget extends StatelessWidget {
  const CustomAppBarLeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(13),
        ),
        child: const Icon(
          Icons.arrow_back_ios_new,
          size: 18,
        ),
      ),
    );
  }
}

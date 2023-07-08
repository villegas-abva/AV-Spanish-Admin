import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/app_divider.dart';
import 'package:flutter/material.dart';

class EditTFQuizField extends StatelessWidget {
  const EditTFQuizField({
    super.key,
    required this.fieldName,
    required this.controller,
  });

  final String fieldName;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AppText(
            fieldName,
            style: AppText.body1Style.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration.collapsed(
              hintText: controller.text,
            ),
          ),
        ),
        const AppDivider(
          color: Colors.black,
        ),
      ],
    );
  }
}

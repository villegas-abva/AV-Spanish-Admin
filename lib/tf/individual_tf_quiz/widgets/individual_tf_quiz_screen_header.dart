import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/custom_app_bar/custom_app_bar_leading_widget.dart';
import 'package:flutter/material.dart';

class IndividualTFQuizScreenHeader extends StatelessWidget {
  const IndividualTFQuizScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 30),
              child: CustomAppBarLeadingWidget(),
            ),
            AppText(
              'This Quiz',
              style: AppText.headline1Style.copyWith(fontSize: 20),
            ),
          ],
        ),
        IconButton(
          // TODO: add delete quiz func.
          onPressed: () {
            print('quiz delted successfully');
          },
          icon: const Icon(Icons.delete_outline, color: Colors.red),
        ),
      ],
    );
  }
}

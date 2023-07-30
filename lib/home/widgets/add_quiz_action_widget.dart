import 'package:av_spanish_admin/home/widgets/add_quiz_bottom_sheet_body_widget.dart';
import 'package:av_spanish_admin/tf/add_tf_quiz/add_tf_quiz_actions.dart';
import 'package:av_spanish_admin/widgets/bottom_sheet/app_bottom_sheet_actions.dart';
import 'package:flutter/material.dart';

class AddQuizActionWidget extends StatelessWidget
    with AppBottomSheetActions, AddTFQuizActions {
  const AddQuizActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // TODO: pop context after navigation.
        openBottomSheet(
          context,
          isDismissable: true,
          child: AddQuizBottomSheetBodyWidget(
            navigateToAddTFQuizScreen: () async {
              // Navigator.pop(context);
              navigateToAddTFQuizScreen(context);
              // Future.delayed(const Duration(milliseconds: 500))
              //     .then((value) => navigateToAddTFQuizScreen(context));
            },
          ),
        );
      },
      icon: Icon(
        Icons.add_circle_outline_outlined,
        color: Colors.blueGrey.shade700,
      ),
    );
  }
}

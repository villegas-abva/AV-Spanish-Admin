import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/app_button.dart';
import 'package:flutter/material.dart';

// TODO: Clean up
class IndividualTFQuizEditFieldsCTA extends StatelessWidget {
  const IndividualTFQuizEditFieldsCTA({
    required this.fieldsCanBeEdited,
    required this.updateFieldsState,
    required this.duration,
    super.key,
  });

  final bool fieldsCanBeEdited;
  final void Function() updateFieldsState;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      child: fieldsCanBeEdited ? _activeStateWidget() : _inactiveStateWidget(),
    );
  }

  Widget _inactiveStateWidget() {
    return AppButton(
      borderRadius: BorderRadius.circular(8),
      height: 35,
      backgroundColor: Colors.white,
      onPressed: updateFieldsState,
      child: AppText(
        'Edit',
        style: AppText.body2Style.copyWith(
          color: AppColors.darkYellow,
        ),
      ),
    );
  }

  Widget _activeStateWidget() {
    return AppButton(
      borderRadius: BorderRadius.circular(8),
      height: 35,
      backgroundColor: AppColors.darkYellow,
      onPressed: updateFieldsState,
      child: AnimatedSwitcher(
        duration: duration,
        child: AppText(
          'Save changes',
          style: AppText.body2Style.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

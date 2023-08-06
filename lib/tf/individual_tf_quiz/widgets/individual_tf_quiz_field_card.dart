import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/app_card_widget.dart';
import 'package:av_spanish_admin/widgets/app_field.dart';
import 'package:flutter/material.dart';

class IndividualTFQuizFieldCard extends StatelessWidget {
  /// An individual quiz field card inside [IndividualTFQuizFieldsWidget].
  ///
  /// Can either be in its initial or editable state.
  const IndividualTFQuizFieldCard({
    super.key,
    required this.duration,
    required this.header,
    required this.subheader,
    required this.fieldsCanBeEdited,
    required this.controller,
  });
  final Duration duration;
  final bool fieldsCanBeEdited;
  final String header;
  final String subheader;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    // TODO: polish animation
    return AnimatedSwitcher(
      duration: duration,
      child: fieldsCanBeEdited
          ? _editableWidget()
          : AppCardWidget(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: AppText(
                    header,
                    style: AppText.body1Style
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                AnimatedSwitcher(
                  duration: duration,
                  child: fieldsCanBeEdited
                      ? _editableWidget()
                      : AppText.body1(
                          subheader,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                ),
              ],
            ),
    );
  }

  Widget _editableWidget() {
    // Return SizedBox for AnimatedSwitcher to detect a different widget.
    // If the same widget is returned (AppCardWidget), the AnimatedSwitcher won't work.
    return SizedBox(
      child: AppCardWidget(
        children: [
          AppField(
            fieldName: header,
            controller: controller,
          ),
        ],
      ),
    );
  }
}

import 'package:av_spanish_admin/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:flutter/material.dart';

const double _borderRadius = 25;

/// The shape of the [TravelHistoryWidget] modal.
const ShapeBorder _shape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(_borderRadius),
    topLeft: Radius.circular(_borderRadius),
  ),
);

mixin AppBottomSheetActions {
  void openBottomSheet(
    BuildContext context, {
    required Widget child,
    double? percentageOfScreenHeight,
    ShapeBorder? shape,
    bool? isDismissable,
  }) {
    showModalBottomSheet(
      shape: shape ?? _shape,
      context: context,
      isDismissible: isDismissable ?? false,
      builder: (context) {
        return AppBottomSheet(
          percentageOfScreenHeight: percentageOfScreenHeight ?? 0.2,
          topBorderRadius: _borderRadius,
          child: child,
        );
      },
    );
  }
}

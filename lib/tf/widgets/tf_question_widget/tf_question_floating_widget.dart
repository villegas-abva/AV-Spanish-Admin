import 'package:flutter/material.dart';

class TFQuestionFloatingWidget extends StatelessWidget {
  /// Returns either a check or X icon, depending on whether the answer to this question is true (check)
  /// or false (X).

  const TFQuestionFloatingWidget({
    required this.isAnswerTrue,
    super.key,
  });

  final bool isAnswerTrue;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(
        1.11,
        0,
      ),
      child: Transform.translate(
        offset: const Offset(0, -20),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: isAnswerTrue ? Colors.green : Colors.red,
            shape: BoxShape.circle,
          ),
          child: Icon(
            isAnswerTrue ? Icons.check : Icons.close,
            size: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:av_spanish_admin/services/models/tf/tf_quiz.dart';
import 'package:flutter/material.dart';

class IndividualTFQuizScreen extends StatelessWidget {
  /// Displays the details of an individual [TFQuiz].
  const IndividualTFQuizScreen({
    required this.quiz,
    super.key,
  });

  final TFQuiz quiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('1 Quiz!'),
        backgroundColor: Colors.grey,
      ),
    );
  }
}

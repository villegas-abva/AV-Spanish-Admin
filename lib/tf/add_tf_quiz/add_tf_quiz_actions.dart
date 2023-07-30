import 'package:av_spanish_admin/tf/add_tf_quiz/add_tf_quiz_screen.dart';
import 'package:av_spanish_admin/tf/add_tf_quiz_questions_state_notifier.dart';
import 'package:av_spanish_admin/tf/bloc/tf_quiz/individual_tf_quiz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

mixin AddTFQuizActions {
  void navigateToAddTFQuizScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider.value(
          value: context.read<AddTFQuizQuestionsStateNotifier>(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider.value(value: context.read<IndividualTFQuizBloc>())
            ],
            child: const AddTFQuizScreen(),
          ),
        ),
      ),
    );
  }
}

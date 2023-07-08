import 'package:av_spanish_admin/services/repository/quiz_repository.dart';
import 'package:av_spanish_admin/tf/add_tf_quiz/add_tf_quiz_screen.dart';
import 'package:av_spanish_admin/tf/add_tf_quiz_questions_state_notifier.dart';
import 'package:av_spanish_admin/tf/bloc/tf_quiz/individual_tf_quiz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AVSpanishAdminApp extends StatefulWidget {
  const AVSpanishAdminApp({Key? key}) : super(key: key);

  @override
  State<AVSpanishAdminApp> createState() => _AvSpanishAppState();
}

class _AvSpanishAppState extends State<AVSpanishAdminApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => AddTFQuizQuestionsStateNotifier(),
        child: BlocProvider(
          create: (context) =>
              IndividualTFQuizBloc(quizRepository: QuizRepository()),
          child: const AddTFQuizScreen(),
        ),
      ),
      // child: const EditTFQuizScreen()),
    );
  }
}

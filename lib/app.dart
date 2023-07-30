import 'package:av_spanish_admin/home/home_screen.dart';
import 'package:av_spanish_admin/services/repository/quiz_repository.dart';
import 'package:av_spanish_admin/tf/add_tf_quiz_questions_state_notifier.dart';
import 'package:av_spanish_admin/tf/bloc/tf_quiz/individual_tf_quiz_bloc.dart';
import 'package:av_spanish_admin/tf/bloc/tf_quiz/tf_quizzes_bloc.dart';
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
        child: MultiBlocProvider(
          providers: [
            BlocProvider<IndividualTFQuizBloc>(
              create: (context) => IndividualTFQuizBloc(QuizRepository()),
            ),
            BlocProvider<TFQuizzesBloc>(
              create: (context) =>
                  TFQuizzesBloc(QuizRepository())..add((FetchQuizzes())),
            ),
          ],
          child: const HomeScreen(),
        ),
      ),
    );
  }
}

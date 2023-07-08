import 'package:av_spanish_admin/tf/bloc/tf_quiz/tf_quizzes_bloc.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/app_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TFQuizzesScreen extends StatelessWidget {
  const TFQuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit TF Quiz'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AppText.headline1('All Quizzes'),
              ),
              BlocBuilder<TFQuizzesBloc, TfQuizzesState>(
                builder: (context, state) {
                  if (state is LoadedTFQuizzesState) {
                    final quizzes = state.quizzes;

                    return quizzes.isEmpty
                        ? AppText.body2(
                            'Whoa! There are no quizzes for this category yet.')
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: quizzes.length,
                            itemBuilder: (context, index) {
                              final quiz = quizzes[index];

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: AppCardWidget(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: AppText.body1(
                                        quiz.title,
                                      ),
                                    ),
                                    AppText.body1(
                                      quiz.url,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

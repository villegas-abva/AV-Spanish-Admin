import 'package:av_spanish_admin/home/widgets/quiz_categories_sections_widget.dart';
import 'package:av_spanish_admin/tf/add_tf_quiz/add_tf_quiz_actions.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/bottom_sheet/app_bottom_sheet_actions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AppBottomSheetActions, AddTFQuizActions {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AppText(
          'Home',
          style: AppText.headline1Style.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              QuizCategoriesSectionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

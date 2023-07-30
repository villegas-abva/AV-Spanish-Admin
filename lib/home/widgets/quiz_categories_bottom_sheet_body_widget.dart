// import 'package:av_spanish_admin/home/widgets/quiz_category_tile.dart';
// import 'package:av_spanish_admin/mc/add_mc_quiz/add_mc_quiz_screen.dart';
// import 'package:av_spanish_admin/tf/add_tf_quiz/add_tf_quiz_screen.dart';
// import 'package:av_spanish_admin/tf/add_tf_quiz_questions_state_notifier.dart';
// import 'package:av_spanish_admin/tf/bloc/tf_quiz/individual_tf_quiz_bloc.dart';
// import 'package:av_spanish_admin/tf/bloc/tf_quiz/tf_quizzes_bloc.dart';
// import 'package:av_spanish_admin/theme/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';

// class QuizCategoriesBottomSheetBodyWidget extends StatelessWidget {
//   const QuizCategoriesBottomSheetBodyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         AppText(
//           'Add a quiz',
//           style: AppText.headline1Style.copyWith(color: Colors.white),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 5, bottom: 5),
//           child: QuizCategoryTile(
//             text: 'Add True-False quiz',
//             navigateTo: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ChangeNotifierProvider.value(
//                     value:
//                         Provider.of<AddTFQuizQuestionsStateNotifier>(context),
//                     child: MultiBlocProvider(
//                       providers: [
//                         BlocProvider.value(
//                           value: BlocProvider.of<IndividualTFQuizBloc>(context),
//                         ),
//                         BlocProvider.value(
//                           value: BlocProvider.of<TFQuizzesBloc>(context),
//                         ),
//                       ],
//                       child: const AddTFQuizScreen(),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         QuizCategoryTile(
//           text: 'Add Multiple Choice quiz',
//           navigateTo: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const AddMCQuizScreen(),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

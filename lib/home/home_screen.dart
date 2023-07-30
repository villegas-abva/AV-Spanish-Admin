import 'package:av_spanish_admin/home/widgets/add_quiz_action_widget.dart';
import 'package:av_spanish_admin/tf/add_tf_quiz/add_tf_quiz_actions.dart';
import 'package:av_spanish_admin/tf/add_tf_quiz/add_tf_quiz_screen.dart';
import 'package:av_spanish_admin/tf/tf_quizzes_screen.dart';
import 'package:av_spanish_admin/theme/theme.dart';
import 'package:av_spanish_admin/widgets/bottom_sheet/app_bottom_sheet_actions.dart';
import 'package:flutter/material.dart';

/// The shape of the [TravelHistoryWidget] modal.
const ShapeBorder _shape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(25),
    topLeft: Radius.circular(25),
  ),
);

class HomeScreen extends StatefulWidget {
  /// A [PageView] whose pages are [TFQuizzesScreen] and [AddTFQuizScreen].
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AppBottomSheetActions, AddTFQuizActions {
  /// The current index of the [PageView] shown.
  final int _selectedIndex = 0;
  final _pages = [
    const TFQuizzesScreen(),
    const AddTFQuizScreen(),
  ];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // TODO: customize to include MC quizzes
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.92),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: AppText(
          'Home',
          style: AppText.headline1Style.copyWith(fontWeight: FontWeight.w500),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: AddQuizActionWidget(),
          ),
        ],
      ),
    );
    // return Scaffold(
    //   body: PageView(
    //     controller: _pageController,
    //     children: _pages,
    //     onPageChanged: (index) {
    //       setState(() {
    //         _selectedIndex = index;
    //       });
    //     },
    //   ),
    //   bottomNavigationBar: BottomNavigationBar(
    //     // TODO: add icons
    //     items: [
    //       BottomNavigationBarItem(
    //         icon: Container(),
    //         label: 'All Quizzes',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Container(),
    //         label: 'New Quiz',
    //       ),
    //     ],
    //     currentIndex: _selectedIndex,
    //     onTap: (index) {
    //       setState(() {
    //         _selectedIndex = index;
    //         _pageController.animateToPage(_selectedIndex,
    //             duration: const Duration(milliseconds: 200),
    //             curve: Curves.linear);
    //       });
    //     },
    //   ),
    // );
  }
}

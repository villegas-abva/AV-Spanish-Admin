import 'package:av_spanish_admin/tf/add_tf_quiz/add_tf_quiz_screen.dart';
import 'package:av_spanish_admin/tf/tf_quizzes_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  /// A [PageView] whose pages are [TFQuizzesScreen] and [AddTFQuizScreen].
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// The current index of the [PageView] shown.
  int _selectedIndex = 0;
  final _pages = [
    const TFQuizzesScreen(),
    const AddTFQuizScreen(),
  ];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // TODO: customize to include MC quizzes
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        // TODO: add icons
        items: [
          BottomNavigationBarItem(
            icon: Container(),
            label: 'All Quizzes',
          ),
          BottomNavigationBarItem(
            icon: Container(),
            label: 'New Quiz',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(_selectedIndex,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear);
          });
        },
      ),
    );
  }
}

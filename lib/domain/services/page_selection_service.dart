import 'package:flutter/material.dart';

class MainPageSelectionService extends ChangeNotifier {
  int pageIndex = 0;

  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void setPageIndex(int selectionIndex) {
    pageIndex = selectionIndex;
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 250),
      curve: Curves.linear,
    );
    notifyListeners();
  }
}

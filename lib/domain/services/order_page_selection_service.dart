import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';

class OrderPageSelectionService extends ChangeNotifier {
  int pageIndex = 0;

  final pageController = PageController();

  void disposeController() {
    pageController.dispose();
  }

  void setPageIndex(int selectionIndex) {
    pageIndex = selectionIndex;
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 250),
      curve: Curves.linear,
    );
    notifyListeners();
  }
}

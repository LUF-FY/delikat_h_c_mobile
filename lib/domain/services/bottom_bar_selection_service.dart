import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';

class BottomBarSelectionService extends ChangeNotifier {
  String? tabSelection = 'main';

  void setTabSelection(String selection) {
    Utils.mainListNav.currentState!.pushReplacementNamed('/$selection');
    tabSelection = selection;
    notifyListeners();
  }
}

import 'package:delikat_h_c_mobile/domain/repository/goods_repository.dart';
import 'package:flutter/material.dart';

class ViewModel extends ChangeNotifier {
  var goodsRepository = GoodsRepository();

  ViewModel() {
    LoadValue();
  }

  void LoadValue() async {
    await goodsRepository.initialize();
    notifyListeners();
  }
}

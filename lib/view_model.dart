// import 'package:delikat_h_c_mobile/domain/entity/goods.dart';
// import 'package:delikat_h_c_mobile/domain/repository/goods_repository.dart';
// import 'package:flutter/material.dart';

// class ViewModel extends ChangeNotifier {
//   final _goodsRepository = GoodsRepository();

//   List<Product> _goodsList = [];
//   List<Product> get goodsList => _goodsList;
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   ViewModel() {
//     init();
//   }

//   init() async {
//     _isLoading = true;
//     notifyListeners();

//     await LoadValue();

//     _isLoading = false;
//     notifyListeners();
//   }

//   Future<void> LoadValue() async {
//     _goodsList = await _goodsRepository.initialize();
//     notifyListeners();
//   }
// }

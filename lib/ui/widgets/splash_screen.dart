import 'package:delikat_h_c_mobile/domain/services/products_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  // var _isSplashScreenBuilt = false;

  @override
  Widget build(BuildContext context) {
    var _isLoaded = context.select((ProductService ps) => ps.isLoaded);
    if (_isLoaded) {
      Navigator.of(context).pop();
    }

    return Scaffold(
      backgroundColor: Utils.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Delikat',
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

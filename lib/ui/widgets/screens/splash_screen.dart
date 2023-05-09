import 'package:delikat_h_c_mobile/domain/services/products_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context
        .read<ProductService>()
        .init()
        .then((_) => Navigator.of(context).pop());

    return Scaffold(
      backgroundColor: Utils.mainGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Деликат',
              style: TextStyle(
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold,
                  color: Utils.mainWhite),
            ),
            SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(
              color: Utils.mainWhite,
            ),
          ],
        ),
      ),
    );
  }
}

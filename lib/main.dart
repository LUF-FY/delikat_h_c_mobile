import 'package:delikat_h_c_mobile/domain/services/bottom_bar_selection_service.dart';
import 'package:delikat_h_c_mobile/domain/services/products_service.dart';
import 'package:delikat_h_c_mobile/domain/services/shopping_cart_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/main_screen.dart';
import 'package:delikat_h_c_mobile/ui/widgets/splash_screen.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomBarSelectionService()),
        ChangeNotifierProvider(create: (_) => ProductService()),
        ChangeNotifierProvider(create: (_) => ShoppingCartService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Delikat Demo',
        theme: ThemeData(
          primaryColor: Colors.green,
          iconButtonTheme: const IconButtonThemeData(
              style: ButtonStyle(
            iconColor: MaterialStatePropertyAll<Color>(Colors.green),
          )),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
          ),
        ),
        initialRoute: '/',
        navigatorKey: Utils.mainAppNav,
        routes: {
          '/': (context) => SplashScreen(),
          '/main': (context) => MainScreen(),
        },
      ),
    );
  }
}

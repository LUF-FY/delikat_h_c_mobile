import 'package:delikat_h_c_mobile/domain/services/order_page_selection_service.dart';
import 'package:delikat_h_c_mobile/domain/services/order_service.dart';
import 'package:delikat_h_c_mobile/domain/services/page_selection_service.dart';
import 'package:delikat_h_c_mobile/domain/services/products_service.dart';
import 'package:delikat_h_c_mobile/domain/services/shopping_cart_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/screens/categories_screen.dart';

import 'package:delikat_h_c_mobile/ui/widgets/screens/main_screen.dart';
import 'package:delikat_h_c_mobile/ui/widgets/screens/order_screen.dart';
import 'package:delikat_h_c_mobile/ui/widgets/screens/splash_screen.dart';
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
        ChangeNotifierProvider(create: (_) => MainPageSelectionService()),
        ChangeNotifierProvider(create: (_) => ProductService()),
        ChangeNotifierProvider(create: (_) => ShoppingCartService()),
        ChangeNotifierProvider(create: (_) => OrderPageSelectionService()),
        ChangeNotifierProvider(create: (_) => OrderService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Delikat',
        // theme: ThemeData(
        //   primaryColor: Colors.green,
        //   iconButtonTheme: const IconButtonThemeData(
        //       style: ButtonStyle(
        //     iconColor: MaterialStatePropertyAll<Color>(Colors.green),
        //   )),
        //   textTheme: const TextTheme(
        //     titleLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        //     bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
        //   ),
        // ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/': (context) => const CategoriesScreen(),
          '/main': (context) => const MainScreen(),
          '/main/order': (context) => const OrderScreen(),
        },
      ),
    );
  }
}

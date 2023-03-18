import 'package:delikat_h_c_mobile/ui/widgets/main_page.dart';
import 'package:delikat_h_c_mobile/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      routes: {
        '/': (context) => ChangeNotifierProvider(
              create: (_) => ViewModel(),
              child: const MainPage(),
            ),
      },
    );
  }
}

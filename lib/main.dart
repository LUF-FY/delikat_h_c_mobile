import 'package:flutter/material.dart';

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
        '/': (context) => const MainPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).primaryColor,
        // leading: IconButton(
        //   onPressed: (() {}),
        //   icon: const Icon(
        //     Icons.menu,
        //     color: Colors.black,
        //   ),
        // ),
        title: const Text(
          'Delikat',
          style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: (() {}),
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: (() {}),
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
              Positioned(
                top: 0,
                right: 3,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: const Center(
                    child: Text(
                      "0",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

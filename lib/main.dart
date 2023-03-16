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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppBarActoins(),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            //print("build");
            //return ItemWidget(product: _products[index]);
          },
          //itemCount: _products.length,
        ),
      ),
    );
  }
}

class AppBarActoins extends StatelessWidget {
  const AppBarActoins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButtonSearch(),
        Stack(
          children: [
            IconButtonCart(),
            Positioned(
              top: 0,
              right: 3,
              child: CounterProductsInCart(),
            )
          ],
        ),
      ],
    );
  }
}

class IconButtonSearch extends StatelessWidget {
  const IconButtonSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
// Открыть текстовое поле

      onPressed: (() {}),
      icon: const Icon(
        Icons.search,
        color: Colors.black,
      ),
    );
  }
}

class IconButtonCart extends StatelessWidget {
  const IconButtonCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
// По нажатию переходить на страницу корзины

      onPressed: (() {}),
      icon: const Icon(
        Icons.shopping_cart,
        color: Colors.black,
      ),
    );
  }
}

class CounterProductsInCart extends StatelessWidget {
  const CounterProductsInCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: const Center(
        child: Text(
// Нужно менять значение

          "0",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

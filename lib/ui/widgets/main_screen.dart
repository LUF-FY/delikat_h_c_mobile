import 'package:delikat_h_c_mobile/ui/widgets/product_catalog_widget.dart';
import 'package:delikat_h_c_mobile/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goodsList = context.select((ViewModel vm) => vm.goodsList);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        // leading: IconButton(
        //   onPressed: (() {}),
        //   icon: const Icon(
        //     Icons.menu,
        //     color: Colors.black,
        //   ),
        // ),
        centerTitle: true,
        title: const Text(
          'Delikat',
          style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
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
            return ProductCatalogWidget(
              goods: goodsList[index],
            );
          },
          itemCount: goodsList.length,
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
          children: const [
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

      onPressed: (() {
        Navigator.pushNamed(context, '/cart');
      }),
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

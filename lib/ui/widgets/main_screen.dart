import 'package:delikat_h_c_mobile/domain/services/bottom_bar_selection_service.dart';
import 'package:delikat_h_c_mobile/domain/services/products_service.dart';
import 'package:delikat_h_c_mobile/domain/services/shopping_cart_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/pages/main_page.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_catalog_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:delikat_h_c_mobile/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goodsList = context.select((ProductService ps) => ps.productsList);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(
          'Delikat',
          style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Navigator(
                key: Utils.mainListNav,
                initialRoute: '/main',
                onGenerateRoute: (RouteSettings settings) {
                  Widget page;
                  switch (settings.name) {
                    case '/main':
                      //page = Center(child: Text('main'));
                      page = MainPage();
                      break;
                    case '/cart':
                      page = Center(child: Text('cart'));
                      break;
                    default:
                      page = Center(child: Text('main'));
                      break;
                  }

                  return PageRouteBuilder(
                      pageBuilder: (_, __, ___) => page,
                      transitionDuration: const Duration(seconds: 0));
                }),
            // child:
          ),
          BottomBar(),
        ],
      ),
    );
  }
}

// class ProductList extends StatefulWidget {
//   const ProductList({Key? key}) : super(key: key);

//   @override
//   _ProductListState createState() => _ProductListState();
// }

// class _ProductListState extends State<ProductList> {
//   @override
//   Widget build(BuildContext context) {
//     final goodsList = context.select((ProductService ps) => ps.productsList);
//     return ListView.builder(
//       itemCount: goodsList.length,
//       itemBuilder: (context, index) {
//         return ProductCatalogWidget(
//           product: goodsList[index],
//         );
//       },
//     );
//   }
// }

class AppBarActoins extends StatelessWidget {
  const AppBarActoins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //IconButtonSearch(),
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
    var countProductInCart =
        context.select((ShoppingCartService sc) => sc.cartProducts.length);

    if (countProductInCart == 0) {
      return SizedBox();
    }

    return Container(
      height: 20,
      width: 20,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: Center(
        child: Text(
// Нужно менять значение
          '${countProductInCart}',
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

// class IconButtonSearch extends StatelessWidget {
//   const IconButtonSearch({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
// // Открыть текстовое поле

//       onPressed: (() {}),
//       icon: const Icon(
//         Icons.search,
//         color: Colors.black,
//       ),
//     );
//   }
// }

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        child: Consumer<BottomBarSelectionService>(
            builder: (context, bottomBarSelectionService, child) {
          return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(Icons.trip_origin,
                        color: bottomBarSelectionService.tabSelection == 'main'
                            ? Utils.mainDark
                            : Utils.mainColor),
                    onPressed: () {
                      bottomBarSelectionService.setTabSelection('main');
                    }),
                IconButton(
                    icon: Icon(Icons.shopping_cart,
                        color: bottomBarSelectionService.tabSelection == 'cart'
                            ? Utils.mainDark
                            : Utils.mainColor),
                    onPressed: () {
                      bottomBarSelectionService.setTabSelection('cart');
                    }),
              ]);
        }));
  }
}

// IconButton(
//     icon: Icon(Icons.favorite,
//         color: bottomBarSelectionService.tabSelection ==
//                 'favorites'
//             ? Utils.mainDark
//             : Utils.mainColor),
//     onPressed: () {
//       bottomBarSelectionService.setTabSelection('favorites');
//     }),

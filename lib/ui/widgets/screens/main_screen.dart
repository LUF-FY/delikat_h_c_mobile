import 'package:delikat_h_c_mobile/domain/services/page_selection_service.dart';
import 'package:delikat_h_c_mobile/domain/services/products_service.dart';
import 'package:delikat_h_c_mobile/domain/services/shopping_cart_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/main_pages/cart_page.dart';
import 'package:delikat_h_c_mobile/ui/widgets/main_pages/main_page.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_catalog_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void dispose() {
    context.read<MainPageSelectionService>().disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Utils.mainColor,
        centerTitle: true,
        title: const Text(
          'Delikat',
          style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<MainPageSelectionService>(
              builder: (context, pss, child) {
                return PageView(
                  onPageChanged: (index) => pss.setPageIndex(index),
                  controller: pss.pageController,
                  children: [
                    MainPage(),
                    CartPage(),
                    //Center(child: Text('main')),
                    //Center(child: Text('cart')),
                  ],
                );
              },
            ),
          ),
          BottomBar(),
        ],
      ),
    );
  }
}

// class AppBarActoins extends StatelessWidget {
//   const AppBarActoins({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         //IconButtonSearch(),
//         Stack(
//           children: const [
//             IconButtonCart(),
//             Positioned(
//               top: 0,
//               right: 3,
//               child: CounterProductsInCart(),
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }

// class IconButtonCart extends StatelessWidget {
//   const IconButtonCart({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
// // По нажатию переходить на страницу корзины

//       onPressed: (() {
//         Navigator.pushNamed(context, '/cart');
//       }),
//       icon: const Icon(
//         Icons.shopping_cart,
//         color: Colors.black,
//       ),
//     );
//   }
// }

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
        child:
            Consumer<MainPageSelectionService>(builder: (context, pss, child) {
          return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(Icons.trip_origin,
                        color: pss.pageIndex == 0
                            ? Utils.mainDark
                            : Utils.mainColor),
                    onPressed: () {
                      pss.setPageIndex(0);
                    }),
                IconButton(
                    icon: Icon(Icons.shopping_cart,
                        color: pss.pageIndex == 1
                            ? Utils.mainDark
                            : Utils.mainColor),
                    onPressed: () {
                      pss.setPageIndex(1);
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

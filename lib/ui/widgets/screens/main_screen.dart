import 'package:delikat_h_c_mobile/domain/services/page_selection_service.dart';
import 'package:delikat_h_c_mobile/domain/services/shopping_cart_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/main_pages/cart_page.dart';
import 'package:delikat_h_c_mobile/ui/widgets/main_pages/main_page.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MainPageSelectionService>().pageIndex = 0;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Utils.mainGreen,
        centerTitle: true,
        title: const Text(
          'Деликат',
          style: TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold),
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
                  children: const [
                    MainPage(),
                    CartPage(),
                  ],
                );
              },
            ),
          ),
          const BottomBar(),
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
      return const SizedBox();
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
          '$countProductInCart',
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
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 10),
        child: Consumer2<MainPageSelectionService, ShoppingCartService>(
            builder: (context, pss, scs, child) {
          return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(Icons.trip_origin,
                        color: pss.pageIndex == 0
                            ? Utils.mainGreenDark
                            : Utils.mainGreen),
                    onPressed: () => pss.setPageIndex(0)),
                SizedBox(
                  height: 70,
                ),
                scs.cartProducts.isEmpty
                    ? IconButton(
                        icon: Icon(Icons.shopping_cart,
                            color: pss.pageIndex == 1
                                ? Utils.mainGreenDark
                                : Utils.mainGreen),
                        onPressed: () => pss.setPageIndex(1))
                    : GestureDetector(
                        onTap: () => pss.setPageIndex(1),
                        child: Container(
                          constraints: BoxConstraints(minHeight: 70),
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: pss.pageIndex == 1
                                  ? Utils.mainGreenDark
                                  : Utils.mainGreen,
                              borderRadius: BorderRadius.circular(50)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('${scs.cartProducts.length}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(height: 10),
                              Icon(Icons.shopping_cart, color: Colors.white)
                            ],
                          ),
                        ),
                      ),
              ]);
        }));
  }
}

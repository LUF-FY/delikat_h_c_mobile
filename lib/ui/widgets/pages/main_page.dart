import 'package:delikat_h_c_mobile/domain/services/products_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_catalog_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductGridView();
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productList = context.select((ProductService ps) => ps.productsList);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        return ProductCatalogWidget(
          product: productList[index],
        );
      },
      itemCount: productList.length,
    );
  }
}

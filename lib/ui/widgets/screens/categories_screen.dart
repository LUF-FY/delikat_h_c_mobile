import 'package:delikat_h_c_mobile/domain/entity/products_category_class.dart';
import 'package:delikat_h_c_mobile/domain/services/products_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesList =
        context.select((ProductService ps) => ps.productsCategoriesList);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Utils.mainColor,
        centerTitle: true,
        title: const Text(
          'Деликат',
          style: TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          RefreshIndicator(
            onRefresh: () => context.read<ProductService>().init(),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                return ProductCategoryWidget(
                  productsCategory: categoriesList[index],
                );
              },
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCategoryWidget extends StatelessWidget {
  const ProductCategoryWidget({Key? key, required this.productsCategory})
      : super(key: key);

  final ProductsCategory productsCategory;

  @override
  Widget build(BuildContext context) {
    return Text(productsCategory.name);
  }
}

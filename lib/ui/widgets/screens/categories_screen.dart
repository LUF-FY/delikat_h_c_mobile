import 'package:delikat_h_c_mobile/domain/entity/products_category_class.dart';
import 'package:delikat_h_c_mobile/domain/services/products_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/Image_widget.dart';
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
        backgroundColor: Utils.mainGreen,
        centerTitle: true,
        title: const Text(
          'Деликат',
          style: TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            PromotionBar(),
            Text(
              'Выберите категорию товаров:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
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
      ),
    );
  }
}

class PromotionBar extends StatelessWidget {
  const PromotionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 80,
        child: ImageWidget(
          img: '/images/products/original/beautiful.jpg',
          fit: BoxFit.fitHeight,
        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: GestureDetector(
        onTap: () {
          final ps = context.read<ProductService>();
          ps.setCategoryId(productsCategory.id);
          ps.loadProducts().then((_) => Navigator.pushNamed(context, '/main'));
        },
        child: Card(
          elevation: 2,
          shadowColor: Colors.green,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(8.0),
                child: ImageWidget(
                  fit: BoxFit.fitHeight,
                  img: productsCategory.image,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    productsCategory.category,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

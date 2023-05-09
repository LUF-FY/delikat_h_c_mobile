import 'package:delikat_h_c_mobile/domain/entity/products_category_class.dart';
import 'package:delikat_h_c_mobile/domain/services/products_service.dart';
import 'package:delikat_h_c_mobile/ui/widgets/product_catalog_widget.dart';
import 'package:delikat_h_c_mobile/ui/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProductGridView();
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productList = context.select((ProductService ps) => ps.productsList);

    return RefreshIndicator(
      onRefresh: () => context.read<ProductService>().loadProducts(),
      child: Column(
        children: [
          CatalogCategoryBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: productList.isEmpty
                  ? EmptyCatalogWidget()
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyCatalogWidget extends StatelessWidget {
  const EmptyCatalogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.content_paste_off,
            color: Colors.grey,
            size: 100,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Список товаров пуст",
            style: TextStyle(color: Colors.grey, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CatalogCategoryBar extends StatelessWidget {
  const CatalogCategoryBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsCategoriesList =
        context.select((ProductService ps) => ps.productsCategoriesList);
    final selectedCategoryId =
        context.select((ProductService ps) => ps.categoryId);

    return Padding(
      padding: EdgeInsets.all(8),
      child: SizedBox(
        height: 48,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsCategoriesList.length,
          itemBuilder: (context, index) {
            return CategoryLabel(
              category: productsCategoriesList[index],
              selectedCategoryId: selectedCategoryId,
            );
          },
        ),
      ),
    );
  }
}

class CategoryLabel extends StatelessWidget {
  const CategoryLabel(
      {Key? key, required this.category, required this.selectedCategoryId})
      : super(key: key);

  final ProductsCategory category;
  final int selectedCategoryId;

  @override
  Widget build(BuildContext context) {
    final ps = context.read<ProductService>();

    final isSelected = category.id == selectedCategoryId;
    final color = isSelected ? Utils.mainGreen : Utils.mainBlack;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          ps.setCategoryId(category.id);
          ps.loadProducts();
        },
        child: Column(
          children: [
            Text(
              category.category,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            isSelected
                ? Container(
                    height: 8,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: color,
                    ),
                  )
                : SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

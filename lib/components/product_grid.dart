import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_grid_item.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

class ProductGrid extends StatelessWidget {
  final bool? showFavoriteOnly;
  const ProductGrid({Key? key, this.showFavoriteOnly}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProduct =
        showFavoriteOnly! ? provider.favoriteItems : provider.items;
    return GridView.builder(
      itemCount: loadedProduct.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedProduct[i],
        child: ProductGridItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}

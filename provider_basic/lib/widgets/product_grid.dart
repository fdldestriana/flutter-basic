import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/provider/all_products.dart';
import 'package:provider_basic/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final allProducts = productData.allProducts;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: allProducts.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: allProducts[i],
        child: const ProductItem(),
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

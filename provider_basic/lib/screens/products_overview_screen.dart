import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/provider/cart.dart';
import 'package:provider_basic/screens/cart_screen.dart';
import 'package:provider_basic/widgets/badge.dart';

import '../widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<Cart>(
            builder: (context, value, child) => Badge(
              value: value.jumlah.toString(),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  icon: const Icon(Icons.shopping_cart)),
            ),
          )
        ],
        centerTitle: true,
        title: const Text('MyShop'),
      ),
      body: const ProductGrid(),
    );
  }
}

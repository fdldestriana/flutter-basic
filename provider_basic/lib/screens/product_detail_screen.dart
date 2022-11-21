import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/provider/all_products.dart';
import 'package:provider_basic/provider/cart.dart';
import 'package:provider_basic/widgets/badge.dart';
import 'cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    final product = Provider.of<Products>(context).getById(productId);
    final cartData = Provider.of<Cart>(context);

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
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            product.title,
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            '\$ ${product.price}',
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            product.description,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Berhasil ditambahkan'),
                  duration: Duration(milliseconds: 500),
                ));
                cartData.addCart(product.id, product.title, product.price);
              },
              child: const Text(
                'Add to cart',
                style: TextStyle(fontSize: 24),
              ))
        ],
      ),
    );
  }
}

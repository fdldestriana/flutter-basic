import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/provider/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const String routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(20),
            child: Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Total : \$ ${cart.totalHarga}',
                  style: const TextStyle(fontSize: 35),
                )),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(cart.items.values.toList()[index].title),
                      subtitle: Text(
                          'Quantity : ${cart.items.values.toList()[index].qty}'),
                      trailing: Text(
                          '${cart.items.values.toList()[index].qty * cart.items.values.toList()[index].price}'),
                    );
                  }))
        ],
      ),
    );
  }
}

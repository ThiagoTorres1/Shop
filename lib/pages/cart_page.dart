import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartList cart = Provider.of(context);
    final items = cart.items.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                      label: Text('R\$${cart.totalAmount.toStringAsFixed(2)}')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

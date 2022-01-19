// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../widgets/cartProducts.dart';
import '../widgets/cartTotal.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Cart'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CartProducts(),
            const Expanded(child: CartTotal()),
          ],
        ),
      ),
    );
  }
}

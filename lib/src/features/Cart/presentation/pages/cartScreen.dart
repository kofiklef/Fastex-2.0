// ignore_for_file: file_names

import 'package:fastex/core/constants/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/cartProducts.dart';
import '../widgets/cartTotal.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key, required this.image}) : super(key: key);
    final String image;

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: const Text('Your Cart'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CartProducts(image: widget.image),
            const Expanded(child: CartTotal()),
          ],
        ),
      ),
    );
  }
}

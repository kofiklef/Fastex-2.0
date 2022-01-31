// ignore_for_file: file_names

import 'package:fastex/core/constants/constants.dart';
import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:fastex/src/features/Cart/controllers/cart_controller.dart';
import 'package:fastex/src/features/Cart/models/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  CartProducts({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 600,
        child: ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (BuildContext context, int index) {
            return CartProductCard(
              index: index,
              controller: controller,
              quantity: controller.products.values.toList()[index],
              product: controller.products.keys.toList()[index],
            );
          },
        ),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final int index, quantity;
  final CartController controller;
  final Product product;
  const CartProductCard({
    Key? key,
    required this.index,
    required this.quantity,
    required this.product,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(
              product.imageURL,
            ),
          ),
          addHorizontal(20),
          Expanded(
            child: Text(
              product.name,
              style: themeData.textTheme.headline6!.copyWith(
                letterSpacing: 0.45,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            onPressed: () {
              controller.removeProduct(product);
            },
            icon: const Icon(Icons.remove_circle, color: black),
          ),
          Text('$quantity', style: const TextStyle(color: black)),
          IconButton(
            onPressed: () {
              controller.addProduct(product);
            },
            icon: const Icon(Icons.add_circle, color: black),
          ),
        ],
      ),
    );
  }
}

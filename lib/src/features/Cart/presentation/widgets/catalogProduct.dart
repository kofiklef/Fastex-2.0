// ignore_for_file: file_names

import 'package:fastex/src/features/Cart/controllers/cart_controller.dart';
import 'package:fastex/src/features/Cart/models/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/constants/widgetFunction.dart';
// import 'cartProducts.dart';

class CatalogProducts extends StatelessWidget {
  const CatalogProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: Product.products.length,
        itemBuilder: (BuildContext context, int index) {
          return CataProductCard(
            index: index,
          );
        },
      ),
    );
  }
}

class CataProductCard extends StatelessWidget {
  final int index;
  final controller = Get.put(CartController());

  CataProductCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    bool isLarge = true;

    return Container(
      decoration: const BoxDecoration(color: black),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: GestureDetector(
          // onTap: () => Navigator.push(
          //   context,
          //   // MaterialPageRoute(
          //   //   builder: (context) => const MainFoodMenu(),
          //   // ),
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(Product.products[index].imageURL),
              ),
              addHorizontal(20),
              Expanded(
                child: Text(
                  Product.products[index].name,
                  overflow: TextOverflow.ellipsis,
                  style: themeData.textTheme.headline6!.copyWith(
                    letterSpacing: 0.45,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Delivery: GH₵ ${Product.products[index].dprice} or more!",
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.addProduct(Product.products[index]);
                },
                icon: const Icon(Icons.add_circle, color: white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

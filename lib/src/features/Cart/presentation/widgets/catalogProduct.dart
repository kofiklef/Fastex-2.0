// ignore_for_file: file_names

import 'package:fastex/src/features/Cart/controllers/cart_controller.dart';
import 'package:fastex/src/features/Cart/models/productModel.dart';
import 'package:fastex/src/features/Homepage/presentation/widgets/mini_Widgets/mainFood.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/constants.dart';
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
  String get description => Product.products[index].description;
  String get image => Product.products[index].imageURL;
  String get name => Product.products[index].name;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(color: black),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainFood(
                image: image,
                name: name,
                description: description,
              ),
            ),
          ),
          child: Card(
            color: Colors.white70,
            elevation: 0,
            child: Container(
              height: size.height * 0.27,
              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Image.asset(
                      Product.products[index].imageURL,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  // addHorizontal(20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        Product.products[index].name,
                        overflow: TextOverflow.ellipsis,
                        style: themeData.textTheme.headline6!.copyWith(
                          letterSpacing: 0.45,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: white,
                        ),
                      ),
                      //   IconButton(
                      //     onPressed: () {
                      //       controller.addProduct(Product.products[index]);
                      //     },
                      //     icon: const Icon(Icons.add_circle, color: white),
                      //   ),
                      // ],
                    ),
                  ),
                  // Expanded(
                  //   child: Text(
                  //     "Delivery: GH₵ ${Product.products[index].dprice} or more!",
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

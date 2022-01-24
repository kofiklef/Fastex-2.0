import 'package:fastex/core/constants/constants.dart';
// import 'package:fastex/src/features/Cart/presentation/bloc/cart_bloc.dart';
// import 'package:fastex/src/features/Cart/presentation/widgets/cartProducts.dart';
import 'package:fastex/src/features/Cart/presentation/pages/cartScreen.dart';
import 'package:fastex/src/features/Cart/presentation/widgets/catalogProduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
      ),
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              const CatalogProducts(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: ocean),
                onPressed: () => Get.to(
                  () => const CartScreen(),
                ),
                child: const Text('Go To Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

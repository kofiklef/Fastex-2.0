// ignore_for_file: file_names

import 'package:fastex/src/features/Cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/constants.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final CartController controller = Get.find();

    return Obx(
      () => Container(
        decoration: const BoxDecoration(
          color: bGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total:',
                style: themeData.textTheme.headline5!.copyWith(
                  // fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
             Text(
                'GH₵ ${controller.total}',
                style: themeData.textTheme.headline5!.copyWith(
                  // fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

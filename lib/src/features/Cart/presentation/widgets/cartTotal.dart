// ignore_for_file: file_names

import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:fastex/src/features/Cart/controllers/cart_controller.dart';
import 'package:fastex/src/features/Cart/presentation/widgets/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/constants.dart';

class CartTotal extends StatefulWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  State<CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  final bool notZero = true;
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
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: themeData.textTheme.headline5!.copyWith(
                        // fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    addVertical(4),
                    Text(
                      'GH₵ ${controller.total}',
                      style: themeData.textTheme.headline5!.copyWith(
                        // fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Payment(),
                      ),
                    );
                  },
                  child: const Text("Proceed To Pay"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

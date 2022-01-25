// ignore_for_file: file_names, unused_local_variable

import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:fastex/src/features/Cart/controllers/cart_controller.dart';
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
        height: MediaQuery.of(context).size.height * 0.5,
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
                  onPressed: _makePayment(context),
                  child: const Text("Proceed To Pay"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _makePayment(BuildContext context) async {
    try {
      final flutterwave = Flutterwave.forUIPayment(
        context: this.context,
        encryptionKey: "FLWSECK_TESTa2bd3c33afd6",
        publicKey: "FLWPUBK_TEST-84e94668f8589cfb05b6f10a7a1e2c27-X",
        currency: FlutterwaveCurrency.GHS,
        amount: "${controller.total}",
        email: "valid@email.com",
        fullName: "Valid Full Name",
        txRef: DateTime.now(),
        isDebugMode: true,
        phoneNumber: "0123456789",
        acceptCardPayment: true,
        acceptUSSDPayment: false,
        acceptAccountPayment: false,
        acceptFrancophoneMobileMoney: false,
        acceptGhanaPayment: true,
        acceptMpesaPayment: false,
        acceptRwandaMoneyPayment: false,
        acceptUgandaPayment: false,
        acceptZambiaPayment: false,
      );

      final ChargeResponse response =
          await flutterwave.initializeForUiPayments();
    } catch (error) {
      handleError(error);
    }
  }
}

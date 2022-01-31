// ignore_for_file: file_names, unused_local_variable, unused_field

import 'dart:io';
import 'dart:math';

import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:fastex/src/features/Cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/constants.dart';

class CartTotal extends StatefulWidget {
  // final String email;
  const CartTotal({Key? key}) : super(key: key);

  @override
  State<CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  String? _ref;

  void setRef() {
    Random rand = Random();
    int number = rand.nextInt(2000);
    if (Platform.isAndroid) {
      setState(() {
        _ref = "AndroidRef_number";
      });
    } else {
      setState(() {
        _ref = "iOSRef_$number";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setRef();
  }

  // void dispose() {
  //   setRef();
  //   super.dispose();
  // }

  final bool notZero = true;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final CartController controller = Get.find();

    return Obx(
      () => Container(
        height: MediaQuery.of(context).size.height * 3.5,
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
                  onPressed: () =>
                      _makePayment(context, controller.total),
                  child: const Text("Proceed To Pay"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _makePayment(BuildContext context, String amount) async {
    try {
      final CartController controller = Get.find();
      final flutterwave = Flutterwave.forUIPayment(
        context: this.context,
        encryptionKey: "FLWSECK_TESTa2bd3c33afd6",
        publicKey: "FLWPUBK_TEST-84e94668f8589cfb05b6f10a7a1e2c27-X",
        currency: "GH₵",
        amount: "${controller.total}",
        email: "",
        fullName: "Valid Full Name",
        txRef: "$_ref",
        isDebugMode: true,
        phoneNumber: "0123456789",
        acceptCardPayment: true,
        acceptUSSDPayment: false,
        acceptAccountPayment: true,
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
      print(error);
    }
  }
}

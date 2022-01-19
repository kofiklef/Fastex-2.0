import 'package:fastex/src/features/Cart/models/productModel.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // add a dictionary to store products in the cart
  final _products = {}.obs;
  bool isLarge = true;
  bool isSmall = true;
  bool nothing = false;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    Get.snackbar(
      "Product added to cart",
      "Your ${product.name} has been added to the cart!",
      snackPosition: SnackPosition.TOP,
      duration: const Duration(milliseconds: 1500),
    );
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }

    Get.snackbar(
      "Product removed from cart",
      "Your ${product.name} has been removed from the cart!",
      snackPosition: SnackPosition.TOP,
      duration: const Duration(milliseconds: 1500),
    );
  }

  get products => _products;

  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total {
    if (_products[products] != 0) {
      _products.entries
          .map((product) => (product.key.dprice) * product.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2);
    } else {
      return "0.00";
    }
  }
}

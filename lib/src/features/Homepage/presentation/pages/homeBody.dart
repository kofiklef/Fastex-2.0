// ignore_for_file: file_names

import 'package:fastex/core/constants/constants.dart';
import 'package:fastex/core/constants/widgetFunction.dart';
// import 'package:fastex/src/features/Cart/models/productModel.dart';
import 'package:fastex/src/features/Cart/presentation/pages/CatalogScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // final int index;
  Widget selectedItem = Container();
  // get image => Product.products[index].imageURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(0.45),
          child: Stack(
            fit: StackFit.expand,
            children: const [
              Image(
                image: AssetImage("assets/images/logo.jpg"),
                fit: BoxFit.fitHeight,
                color: Colors.black87,
                colorBlendMode: BlendMode.darken,
              ),
              // Column(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => CatalogScreen()),
        child: const Icon(
          Icons.shopping_cart_outlined,
          color: white,
          size: 28,
        ),
      ),
    );
  }

  // void _showModalBottomSheet() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return Container(
  //         color: Colors.black87,
  //         child: buildModalSheet(),
  //       );
  //     },
  //   );
  // }

  Container buildModalSheet() {
    final ThemeData themeData = Theme.of(context);
    List<String> filter = [
      "Local Dishes",
      "Continental Dishes",
      "Pastries",
      "Drinks",
      "Special Delivery"
    ];

    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      // color: white,
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: filter.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ocean,
                      elevation: 0.25,
                    ),
                    onPressed: () => _selectItem,
                    child: Text(
                      filter[index],
                      style: themeData.textTheme.subtitle1
                          .copyWith(color: white, letterSpacing: 0.75),
                    ),
                  ),
                ),
                addHorizontal(5)
              ],
            ),
          );
        },
      ),
    );
  }

  void _selectItem(Widget widget) {
    setState(() {
      selectedItem = widget;
    });
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:fastex/core/constants/constants.dart';
import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:flutter/material.dart';

class MainFood extends StatefulWidget {
  MainFood({
    Key key,
  }) : super(key: key);

  // final String description;

  @override
  _MainFoodState createState() => _MainFoodState();
}

int index;

class _MainFoodState extends State<MainFood> {
  // String get name => FoodDetails.[widget.index].name;
  // String get description => Fo.products[widget.index].description;
  AsyncSnapshot snapshot;
  String get image => snapshot.data[index].image;
  String get name => snapshot.data[index].name;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: Text(
            name,
            style: themeData.textTheme.headline6.copyWith(
              letterSpacing: 1.25,
              fontWeight: FontWeight.w800,
              color: white,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PictureContainer(size),
              addVertical(size.height * 0.015),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            VendorName(themeData, size, "", ""),
                            Description(themeData, size, "name", "description"),
                          ],
                        ),
                        // addVertical(size.height),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ListView.builder(
                              itemBuilder: (context, index) => const Card(
                                color: transparent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded VendorName(
      ThemeData themeData, Size size, String name, String description) {
    return Expanded(
      child: Container(
        height: size.height * .17,
        child: Card(
          color: transparent,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Vendor", style: themeData.textTheme.headline6),
                addVertical(size.height * 0.015),
                Text(
                  name,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded Description(
      ThemeData themeData, Size size, String name, String description) {
    return Expanded(
      child: Container(
        height: size.height * .2,
        child: Card(
          color: transparent,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dealers in: ", style: themeData.textTheme.headline6),
                addVertical(size.height * 0.015),
                Text(
                  description,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container PictureContainer(Size size) {
    return Container(
      height: size.height * .30,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Image.network(
        image,
        fit: BoxFit.contain,
      ),
    );
  }
}

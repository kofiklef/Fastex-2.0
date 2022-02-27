// ignore_for_file: non_constant_identifier_names

import 'package:fastex/core/constants/constants.dart';
import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:flutter/material.dart';

class MainFood extends StatefulWidget {
  const MainFood({
    Key key,
    @required this.image,
    @required this.description,
    @required this.name,
  }) : super(key: key);
  final String description, image, name;

  @override
  _MainFoodState createState() => _MainFoodState();
}

class _MainFoodState extends State<MainFood> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: FutureBuilder(
          // future: _api.getSpecificFood(index),
          builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            title: Text(
              widget.name,
              style: themeData.textTheme.headline6.copyWith(
                letterSpacing: 1.25,
                fontWeight: FontWeight.w800,
                color: white,
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PictureContainer(size),
                  addVertical(size.height * 0.015),
                  Description_Vendor(themeData, size),
                  addVertical(size.height * 0.01),
                  Text(
                    "Dealers In: ",
                    style: themeData.textTheme.headline5,
                  ),
                  DealersIn(themeData, size),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Padding Description_Vendor(ThemeData themeData, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            VendorName(themeData, size, "", ""),
            Description(themeData, size, widget.name, widget.description),
          ],
        ),
      ),
    );
  }

  Expanded VendorName(
      ThemeData themeData, Size size, String name, String description) {
    return Expanded(
      child: SizedBox(
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
                Text("Description: ", style: themeData.textTheme.headline6),
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

  Expanded DealersIn(ThemeData themeData, Size size) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .035, vertical: size.height * 0.01),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              width: size.width * 0.7,
              // height: size.height * 0.6,
              color: transparent,
              child: Padding(
                padding: EdgeInsets.only(right: size.width * .05),
                child: Card(
                  color: bGrey,
                  child: Stack(
                    children: [
                      PictureContainer(size),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Any Food",
                            style: themeData.textTheme.subtitle1.copyWith(
                              color: white,
                              letterSpacing: 0.75,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: 5,
        ),
      ),
    );
  }

  Container PictureContainer(Size size) {
    return Container(
      height: size.height * .30,
      width: size.width,
      decoration: const BoxDecoration(
        color: transparent,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/images/beans.jpeg",
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                iconSize: 28,
                color: bGrey,
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

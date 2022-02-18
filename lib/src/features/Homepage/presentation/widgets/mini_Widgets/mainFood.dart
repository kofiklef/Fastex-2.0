// ignore_for_file: non_constant_identifier_names

import 'package:fastex/core/constants/constants.dart';
import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:fastex/core/shared/loading.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PictureContainer(size),
                addVertical(size.height * 0.015),
                Description_Vendor(themeData, size),
                addVertical(size.height * 0.01),
                const Text("Dealers In: "),
                DealersIn(themeData, size),
              ],
            ),
          ),
        );
      }),
    );
  }

  Expanded Description_Vendor(ThemeData themeData, Size size) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VendorName(themeData, size, "", ""),
                  Description(themeData, size, widget.name, widget.description),
                ],
              ),
              // addVertical(size.height),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => const Card(
                    color: transparent,
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(right: 15),
          itemBuilder: (context, index) {
            return Container(
              width: size.width,
              color: transparent,
              child: const Card(
                color: bGrey,
                child: Text("data"),
              ),
            );
          },
          separatorBuilder: (context, builder) => SizedBox(
            width: size.width * 0.17,
          ),
          itemCount: 5,
        ),
      ),
    );
  }

  Container PictureContainer(Size size, {AsyncSnapshot snapshot, int index}) {
    return Container(
      height: size.height * .30,
      width: size.width * .85,
      decoration: const BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: !loading
            ? const Center(child: Loading())
            : Image.network(
                snapshot.data[index].image,
                fit: BoxFit.fitWidth,
              ),
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:fastex/core/constants/constants.dart';
import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:flutter/material.dart';

class MainFood extends StatefulWidget {
  const MainFood({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
  }) : super(key: key);

  final String image;
  final String name;
  final String description;

  @override
  _MainFoodState createState() => _MainFoodState();
}

class _MainFoodState extends State<MainFood> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: Text(
            widget.name,
            style: themeData.textTheme.headline5!.copyWith(
              letterSpacing: 1.25,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              PictureContainer(size),
              addVertical(size.height * 0.015),
              Expanded(
                child: Container(
                  color: black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 7.5, vertical: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Text(widget.name),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(widget.description),
                              ),
                            )
                          ],
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

  Container PictureContainer(Size size) {
    return Container(
      height: size.height * .30,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Image.asset(
        widget.image,
        fit: BoxFit.contain,
      ),
    );
  }
}

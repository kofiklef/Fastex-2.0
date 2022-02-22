import 'package:fastex/src/features/Homepage/domain/entities/landing.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LandingModel extends Landing {
  LandingModel({
    @required this.name,
    @required this.image,
    @required this.extraData,
    @required this.price,
  }) : super(
          name: name,
          image: image,
          price: price,
          extraData: extraData,
        );
  final String name, extraData;
  final int price;
  dynamic image;

  factory LandingModel.fromJson(Map<String, dynamic> json) {
    return LandingModel(
      name: json['name'],
      image: json['image'],
      extraData: json['extraData'],
      price: (json['price'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "extraData": extraData,
      "image": image,
      "price": price,
    };
  }
}

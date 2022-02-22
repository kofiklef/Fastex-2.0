import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Landing extends Equatable {
  final String name, extraData;
  final int price;
  final dynamic image;

  const Landing({
    @required this.name,
    @required this.extraData,
    @required this.price,
    @required this.image,
  });

  @override
  List<Object> get props => [name, price, image, extraData];
}

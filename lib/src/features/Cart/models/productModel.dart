// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
        @required this.productId,
        @required this.name,
        @required this.productCategoryId,
        @required this.vendorId,
        @required this.price,
        @required this.extraData,
        @required this.image,
    });

    int productId;
    String name;
    int productCategoryId;
    int vendorId;
    int price;
    String extraData;
    dynamic image;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productID"],
        name: json["name"],
        productCategoryId: json["productCategoryID"],
        vendorId: json["vendorID"],
        price: json["price"],
        extraData: json["extraData"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "productID": productId,
        "name": name,
        "productCategoryID": productCategoryId,
        "vendorID": vendorId,
        "price": price,
        "extraData": extraData,
        "image": image,
    };
}

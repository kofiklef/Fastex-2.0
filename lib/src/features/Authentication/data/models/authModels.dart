// To parse this JSON data, do
//
//     final Post = authServiceFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

// import 'package:fastex/core/shared/human.dart';

List<Post> postFromJson(String str) => List<Post>.from(
    json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    @required this.email,
    @required this.phoneNumber,
    @required this.passwordHash,
    @required this.userName,
    this.isVendor,
    this.agreedToc,
  });

  List<Post> get user {
    return postFromJson(email);
  }

  int id;
  String firstName;
  String middleName;
  String lastName;
  String email;
  String phoneNumber;
  dynamic passwordHash;
  dynamic userName;
  bool isVendor;
  bool agreedToc;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        passwordHash: json["passwordHash"],
        userName: json["userName"],
        isVendor: json["isVendor"],
        agreedToc: json["agreedTOC"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "passwordHash": passwordHash,
        "userName": userName,
        "isVendor": isVendor,
        "agreedTOC": agreedToc,
      };
}

class AuthRequest {
  String email;
  String password;

  AuthRequest({this.email, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> loginMap = {
      "userName": email,
      "password": password,
    };
    return loginMap;
  }
}

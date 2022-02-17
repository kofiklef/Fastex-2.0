// To parse this JSON data, do
//
//     final authService = authServiceFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

// import 'package:fastex/core/shared/human.dart';

List<AuthService> authServiceFromJson(String str) => List<AuthService>.from(
    json.decode(str).map((x) => AuthService.fromJson(x)));

String authServiceToJson(List<AuthService> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AuthService {
  AuthService({
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

  List<AuthService> get user {
    return authServiceFromJson(email);
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

  factory AuthService.fromJson(Map<String, dynamic> json) => AuthService(
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

  // Stream<Human> get thisUser {
  //   return true;
  // }
}

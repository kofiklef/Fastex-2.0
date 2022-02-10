import 'package:flutter/material.dart';

class Human {
  final String uid;

  Human({this.uid});
}

class UserData {
  final String uid;
  final String fname;
  final String contact;
  final String email;

  UserData({
    @required this.fname,
    @required this.contact,
    @required this.email,
    @required this.uid,
  });
}

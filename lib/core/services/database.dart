import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Database {
  final String? uid;
  Database({this.uid});

  final CollectionReference foodCollection =
      FirebaseFirestore.instance.collection('Foods');

  Future<void> createEndUser(String name, email, location) async {
    final User? user = FirebaseAuth.instance.currentUser;
    return await foodCollection.doc(user!.uid).set({
      'name': name,
      'email': email,
      'location': location,
    }).then((value) {
      const SnackBar(
        content: Text("New user added!"),
      );
    });
  }
}

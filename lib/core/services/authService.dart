// ignore_for_file: file_names, avoid_print

import 'package:crypt/crypt.dart';
import 'package:fastex/core/shared/human.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final String? uid;
  AuthService({this.uid});

  Human? _userFromFirebase(person) {
    return person != null ? Human(uid: person.uid) : null;
  }

  Stream<Human?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  Future<bool> checkPassword(String email, String password) async {
    String? storedHash = await storage.read(key: email);
    return Future.value(Crypt(storedHash!).match(password));
  }

  Future signup(
    String email,
    String password,
  ) async {
    try {
      String hashedPassword = Crypt.sha256(password).toString();
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: hashedPassword);
      User? student = _auth.currentUser;
      User? person = result.user;
      Map<String, String> userMap = {
        'email': email,
        'hashedPassword': password,
      };
      // create Database for user on Signup
      await Database(uid: student!.uid).uploadUserInfo(userMap);

      //! Verification
      if (!student.emailVerified && student != null) {
        student.sendEmailVerification();
      } else {
        if (student.emailVerified) {
          return _userFromFirebase(person);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("Password provided is weak!");
      } else if (e.code == "email-already-in-use") {
        print('Account already in use');
      }
      return null;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future login(String email, String password,
      {required BuildContext context}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? student = _auth.currentUser;
      if (student!.emailVerified) {
        User? client = result.user;
        return _userFromFirebase(client);
      } else {
        throw NoSuchMethodError;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found! \nTry creating a New Account!");
        // Navigator.pop(context);
      } else if (e.code == "wrong-password") {
        print(
            'Invalid password provided... \nPlease try again with valid credentials');
        // Navigator.pop(context);
      } else {
        print('An unknown error has occurred!\n Please try again later!');
      }
      return null;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

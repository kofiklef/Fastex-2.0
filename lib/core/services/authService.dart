// ignore_for_file: file_names, avoid_print, unrelated_type_equality_checks, unused_local_variable

import 'package:crypt/crypt.dart';
import 'package:fastex/core/shared/human.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final String uid;
  AuthService({this.uid});

  Human _userFromFirebase(person) {
    return person != null ?  Human(uid: person.uid) : null;
  }

  Stream<Human> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  Future checkPassword(String email, String password) async {
    String storedHash = await storage.read(key: email);
    return await Future.value(Crypt(storedHash).match(password));
  }

  Future signup(String email, String password) async {
    try {
      String hashedPassword = Crypt.sha256(password).toString();
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: hashedPassword);
      print(hashedPassword);
      User student = _auth.currentUser;
      User person = result.user;

      //! Verification
      if (student.emailVerified) {
        student.sendEmailVerification();
      } else {
        if (student.emailVerified) {
          return _userFromFirebase(person);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("Password provided is weak");
      } else if (e.code == "email-already-in-use") {
        print('Account already in use');
      }
      return null;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final hashedPassword = Crypt(password);

      const correctValue = 'p@ssw0rd';
      const wrongValue = '123456';

      checkPassword(email, password);
      if (password == Crypt(password)) {
        User student = _auth.currentUser;
        if (student.emailVerified) {
          User client = result.user;
          return _userFromFirebase(client);
        } else {
          throw NoSuchMethodError;
        }
      } else {
        return null;
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

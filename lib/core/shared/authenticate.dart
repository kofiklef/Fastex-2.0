import 'package:fastex/src/features/Authentication/presentation/pages/login.dart';
import 'package:fastex/src/features/Authentication/presentation/pages/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogin = true;
  void toggleView() {
    setState(() => showLogin = showLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return Register(toggleView: toggleView);
    } else {
      return Login(toggleView: toggleView);
    }
  }
}

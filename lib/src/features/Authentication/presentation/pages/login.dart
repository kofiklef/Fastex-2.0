import 'package:fastex/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ocean,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: white,
          onPressed: () => ZoomDrawer.of(context)!.toggle(),
          iconSize: 30.0,
        ),
        title: Text(
          "Login",
          style: themeData.textTheme.headline1,
        ),
      ),
      body: const Center(
        child: Text(
          "this is the login page",
          style: TextStyle(color: ocean),
        ),
      ),
    );
  }
}

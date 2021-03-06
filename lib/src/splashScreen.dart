// import 'package:fastex/core/shared/wrapper.dart';
import 'package:fastex/src/features/Authentication/presentation/pages/login.dart';
import 'package:fastex/src/features/homepage.dart';
// import 'package:fastex/src/features/landingPage.dart';
import 'package:flutter/material.dart';

import '../core/constants/constants.dart';
import 'features/Authentication/presentation/pages/register.dart';
// ignore_for_file: file_names

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  _navigateHome() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>  const Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: white),
      child: Center(
        child: Image.asset(
          "assets/images/logo.jpg",
          width: MediaQuery.of(context).size.width,
          // scale: 2.0,
        ),
      ),
    );
  }
}

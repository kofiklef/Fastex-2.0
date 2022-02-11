// @dart = 2.7

// ignore_for_file: missing_required_param

import 'package:fastex/core/shared/human.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'src/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Fastex());
}

class Fastex extends StatelessWidget {
  const Fastex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Human>.value(
      initialData: Human(uid: "uid"),
      // value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: FlexThemeData.light(scheme: FlexScheme.blueWhale),
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.blueWhale),
        home: const SplashScreen(),
      ),
    );
  }
}

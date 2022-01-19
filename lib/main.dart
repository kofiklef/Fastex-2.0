
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/splashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const GetMaterialApp(
      home: Fastex(),
      debugShowCheckedModeBanner: false,
    ), 
  );
}

class Fastex extends StatelessWidget {
  const Fastex({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(scheme: FlexScheme.blueWhale),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.blueWhale),
      home: const SplashScreen(),
    );
  }
}

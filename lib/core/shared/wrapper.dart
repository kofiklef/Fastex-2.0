
import 'package:fastex/src/features/landingPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authenticate.dart';
import 'human.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final client = Provider.of<Human?>(context);
    if (client == null) {
      return const Authenticate();
    } else {
      return const LandingPage();
    }
  }
}
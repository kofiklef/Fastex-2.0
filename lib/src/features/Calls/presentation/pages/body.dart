// ignore_for_file: file_names
// import 'package:fastex/core/constants/constants.dart';
import 'package:flutter/material.dart';

class callBody extends StatelessWidget {
  const callBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Stack(
          fit: StackFit.expand,
          children: const [
            Image(
              image: AssetImage("assets/images/logo.jpg"),
              fit: BoxFit.fitHeight,
              color: Colors.black87,
              colorBlendMode: BlendMode.darken,
            ),
          ],
        ),
      ),
    );
  }
}

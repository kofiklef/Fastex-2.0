// ignore_for_file: file_names, camel_case_types
import 'package:fastex/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'body.dart';

class callScreen extends StatefulWidget {
  const callScreen({Key? key}) : super(key: key);

  @override
  _callScreenState createState() => _callScreenState();
}

class _callScreenState extends State<callScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: lightB,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: white,
          onPressed: () => ZoomDrawer.of(context)!.toggle(),
          iconSize: 30.0,
        ),
        title: Text(
          "Call Us",
          style: themeData.textTheme.headline2,
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
            iconSize: 30.0,
          ),
        ],
      ),
      body: const callBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(
          Icons.call,
          color: white,
          size: 28,
        ),
      ),
    );
  }
}

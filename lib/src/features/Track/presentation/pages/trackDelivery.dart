// ignore_for_file: file_names

import 'package:fastex/src/features/Track/presentation/widgets/newMap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../../../../core/constants/constants.dart';

class TrackDelivery extends StatefulWidget {
  const TrackDelivery({Key key}) : super(key: key);

  @override
  _TrackDeliveryState createState() => _TrackDeliveryState();
}

class _TrackDeliveryState extends State<TrackDelivery> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    const String error = "";
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        // backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: white,
          onPressed: () => ZoomDrawer.of(context).toggle(),
          iconSize: 30.0,
        ),
        title: Text(
          "Track Delivery",
          style: themeData.textTheme.headline2.copyWith(
            color: white,
            fontSize: 24,
            letterSpacing: 1.25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const Tracker(),
    );
  }
}

// ignore_for_file: file_names

import 'package:fastex/core/constants/constants.dart';
// import 'package:fastex/core/shared/authenticate.dart';
import 'package:fastex/src/features/Authentication/presentation/pages/login.dart';
import 'package:fastex/src/features/Calls/presentation/pages/callScreen.dart';
import 'package:fastex/src/features/Track/presentation/pages/trackDelivery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'Chats/data/datasources/menuItems.dart';
import 'Homepage/presentation/widgets/sidebar.dart';
import 'homepage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  MenuItem currentItem = MenuItems.home;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      backgroundColor: white,
      borderRadius: 45,
      showShadow: true,
      angle: -15,
      style: DrawerStyle.Style2,
      mainScreen: getPages(),
      menuScreen: Builder(
        builder: (context) {
          return Menupage(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() => currentItem = item);
              ZoomDrawer.of(context)!.close();
            },
          );
        },
      ),
    );
  }

  Widget getPages() {
    switch (currentItem) {
      case MenuItems.logout:
        return const Login();
      case MenuItems.profile:
        return const Homepage();
      case MenuItems.calls:
        return const callScreen();
      case MenuItems.tracker:
        return const TrackDelivery();
      default:
        return const Homepage();
    }
  }
}

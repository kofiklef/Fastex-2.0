// ignore_for_file: file_names

import 'package:fastex/core/constants/constants.dart';

import 'package:fastex/src/features/Calls/presentation/pages/callScreen.dart';
import 'package:fastex/src/features/Track/presentation/pages/trackDelivery.dart';
import 'package:fastex/src/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'Chats/data/datasources/menuItems.dart';
import 'Homepage/presentation/widgets/sidebar.dart';
import 'homepage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  MenuItem currentItem = MenuItems.home;
  // final AuthService _auth = AuthService();

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
          return GestureDetector(
            // onTap: Navigator.pop(context),
            child: Menupage(
              currentItem: currentItem,
              onSelectedItem: (item) {
                setState(() => currentItem = item);
                ZoomDrawer.of(context).close();
              },
            ),
          );
        },
      ),
    );
  }

  Widget getPages() {
    switch (currentItem) {
      case MenuItems.logout:
        return const ElevatedButton(
          // onPressed: () => _auth.logout(),
          child: Text("Logout"),
        );

      case MenuItems.profile:
        return Homepage();
      case MenuItems.calls:
        return const callScreen();
      case MenuItems.tracker:
        return const TrackDelivery();
      case MenuItems.search:
        return const SearchScreen();
      default:
        return Homepage();
    }
  }
}

import 'package:fastex/core/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../Chats/data/datasources/menuItems.dart';

class MenuItems {
  static const notify =
      MenuItem("Notifications", Icons.notifications_active_outlined);
  static const tracker = MenuItem("Tracker", Icons.track_changes);
  static const profile = MenuItem("Profile", Icons.person_outline_outlined);
  static const logout = MenuItem("Logout", Icons.exit_to_app_outlined);
  static const calls = MenuItem("Call Us", Icons.call);
  static const search = MenuItem("Search", Icons.search);
  static const home = MenuItem("Home", Icons.home_filled);

  static const all = <MenuItem>[
    profile,
    calls,
    tracker,
    home,
    // notify,
    search,
    logout,
  ];
}

class Menupage extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;
  const Menupage({
    Key key,
    @required this.currentItem,
    @required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: white,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                ...MenuItems.all.map(buildMenuItem).toList(),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItem item) => Builder(
        builder: (context) {
          final ThemeData themeData = Theme.of(context);
          return ListTileTheme(
            selectedColor: white,
            child: ListTile(
              leading: Icon(item.icon, color: Colors.black),
              title: Text(
                item.title,
                style: themeData.textTheme.headline5.copyWith(
                  color: Colors.black54,
                  letterSpacing: 0.25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () => onSelectedItem(item),
              minLeadingWidth: 20,
              selected: currentItem == item,
              selectedTileColor: Colors.black26,
            ),
          );
        },
      );
}

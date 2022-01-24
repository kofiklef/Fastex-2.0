import 'package:fastex/src/features/Cart/presentation/pages/CatalogScreen.dart';
import 'package:fastex/src/features/Cart/presentation/pages/cartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../core/constants/constants.dart';
import 'Calls/presentation/pages/body.dart';
// import 'Homepage/presentation/pages/homeBody.dart';
import 'Cart/presentation/widgets/catalogProduct.dart';
import 'Homepage/presentation/pages/homeBody.dart';
import 'Track/presentation/widgets/newMap.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Widget selectedItem = Container();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            color: white,
            onPressed: () => ZoomDrawer.of(context)!.toggle(),
            iconSize: 30.0,
          ),
          title: Text(
            "FastEx",
            style: themeData.textTheme.headline2!.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: white,
              letterSpacing: 1.25,
            ),
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
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.food_bank_outlined, color: white)),
              Tab(icon: Icon(Icons.history_sharp, color: white)),
              Tab(icon: Icon(Icons.map_rounded, color: white)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CatalogProducts(),
            callBody(),
            Tracker(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen())),
          child: const Icon(Icons.shopping_cart_outlined),
        ),
      ),
    );
  }
}

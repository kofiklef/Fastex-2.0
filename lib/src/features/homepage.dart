import 'package:fastex/src/features/Cart/presentation/pages/cartScreen.dart';
import 'package:fastex/src/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../core/constants/constants.dart';
import 'Calls/presentation/pages/body.dart';
import 'Cart/presentation/widgets/catalogProduct.dart';
import 'Track/presentation/widgets/newMap.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key, this.image}) : super(key: key);
  String image;
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
          // backgroundColor: Colors.deepOrangeAccent,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            color: white,
            onPressed: () => ZoomDrawer.of(context).toggle(),
            iconSize: 30.0,
          ),
          title: Text(
            "FastEx Deliveries",
            style: themeData.textTheme.headline2.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: white,
              letterSpacing: .75,
              wordSpacing: 1.25,
            ),
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.white,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              ),
              iconSize: 30.0,
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.food_bank_outlined, color: white)),
              Tab(icon: Icon(Icons.delivery_dining_outlined, color: white)),
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
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(image: widget.image),
            ),
          ),
          child: const Icon(Icons.shopping_cart_outlined),
        ),
      ),
    );
  }
}

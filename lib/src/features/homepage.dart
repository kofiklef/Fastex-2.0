import 'package:fastex/src/features/Cart/presentation/pages/cartScreen.dart';
import 'package:fastex/src/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../core/constants/constants.dart';
import 'Calls/presentation/pages/body.dart';
import 'Cart/presentation/widgets/catalogProduct.dart';

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
      length: 2,
      child: Scaffold(
        appBar: appBarComponent(
          dBlue,
          IconButton(
            icon: const Icon(Icons.menu_outlined),
            color: white,
            onPressed: () {},
          ),
          "FastEx Deliveries",
          const Icon(Icons.search, color: white),
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchScreen(),
            ),
          ),
          "Search"
        ),
        body: const TabBarView(
          children: [
            CatalogProducts(),
            callBody(),
            // Tracker(), // kMiniMall
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

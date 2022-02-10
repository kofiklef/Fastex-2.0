// ignore_for_file: file_names

import 'package:fastex/src/features/Cart/models/productModel.dart';
import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:fastex/core/shared/fastexAPI.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';

class CatalogProducts extends StatefulWidget {
  const CatalogProducts({
    Key key,
  }) : super(key: key);

  @override
  State<CatalogProducts> createState() => _CatalogProductsState();
}

class _CatalogProductsState extends State<CatalogProducts> {
  bool loading = false;
  final FastexAPI _api = FastexAPI();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);

    return Flexible(
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
            image: AssetImage("assets/images/logo.jpg"),
            fit: BoxFit.fitHeight,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          FutureBuilder(
              future: _api.fetchFoods(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.5, vertical: 10),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        Product product = snapshot?.data[index];
                        return GestureDetector(
                          onTap: () {},
                          child: Card(
                            color: Colors.white70,
                            elevation: 0,
                            child: SizedBox(
                              height: size.height * 0.27,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Image.network(
                                      product.image,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        product.name,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.lato(
                                          textStyle: themeData
                                              .textTheme.subtitle1
                                              .copyWith(
                                            letterSpacing: 0.45,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            color: white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => addVertical(
                          MediaQuery.of(context).size.height * 0.0275),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              }),
        ],
      ),
    );
  }
}

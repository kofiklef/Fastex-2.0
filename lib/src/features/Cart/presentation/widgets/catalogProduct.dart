// ignore_for_file: file_names

import 'package:fastex/core/constants/widgetFunction.dart';
import 'package:fastex/core/shared/fastexAPI.dart';
import 'package:fastex/src/features/Homepage/presentation/widgets/mini_Widgets/mainFood.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

    return Stack(
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
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.5, vertical: 10),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      // Product product = snapshot.data;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  MainFood(
                                image: snapshot.data[index].image,
                                name: snapshot.data[index].name,
                                description: snapshot.data[index].extraData,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.white70,
                          elevation: 0,
                          child: SizedBox(
                            height: size.height * 0.27,
                            child: Stack(
                              children: [
                                Center(
                                  child: !loading
                                      ? const Center(
                                          child: SpinKitFadingCircle(
                                            color: bGrey,
                                            size: 55,
                                          ),
                                        )
                                      : Image.network(
                                          snapshot.data[index].image,
                                          fit: BoxFit.fitWidth,
                                        ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Text(
                                      snapshot.data[index].name,
                                      overflow: TextOverflow.ellipsis,
                                      style: themeData.textTheme.subtitle1
                                          .copyWith(
                                        letterSpacing: 0.45,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        // fontStyle: FontStyle.italic,
                                        color: white,
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
                  child: SpinKitFadingCircle(
                    color: bGrey,
                    size: 120,
                  ),
                );
              }
            }),
      ],
    );
  }
}

import 'package:fastex/src/features/Homepage/data/models/vendorModel.dart';
import 'package:flutter/material.dart';

class Vendors extends StatefulWidget {
  const Vendors({Key key}) : super(key: key);

  @override
  _VendorsState createState() => _VendorsState();
}

class _VendorsState extends State<Vendors> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      // controller: controller,
      // child: ListView.builder(
      //   itemCount: vendors.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return const Card();
      //   },
      // ),
    );
  }
}

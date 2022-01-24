import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          cardWidget(context),
        ],
      ),
    );
  }

  Container cardWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.5,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 1.0,
        child: SizedBox(
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

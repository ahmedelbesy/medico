import 'package:flutter/material.dart';
import 'package:medicoo/widget/constant.dart';

class ORDER_Page extends StatefulWidget {
  @override
  _ORDER_PageState createState() => _ORDER_PageState();
}

class _ORDER_PageState extends State<ORDER_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        iconTheme: IconThemeData(
          color: KIcons,
        ),
        title: Text(
          "ORDERS",
          style: TextStyle(color: KIcons),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: Container()),
    );
  }
}

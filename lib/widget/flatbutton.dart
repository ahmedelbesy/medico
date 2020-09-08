import 'package:flutter/material.dart';
// ignore: camel_case_types
class flatbutton extends StatelessWidget {
  flatbutton({@required this.color, this.string, this.function});

  final String string;
  final Color color;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: FlatButton(
            onPressed: function,
            child: Text(
              string,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )),
      ),
    );
  }
}
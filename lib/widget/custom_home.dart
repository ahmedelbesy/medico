import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress,});
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
        child: Card(
          margin: EdgeInsets.all(15),
          shadowColor: Colors.white,
          color: colour,
          child: cardChild,
          elevation:10,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medicoo/UI/Coustm_widget/constant.dart';

class InkWell_Drawer extends StatelessWidget {
  final String text;
  final Function function;
  InkWell_Drawer({@required this.text, this.function});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: ListTile(
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: KIcons,
           borderRadius: BorderRadius.circular(30)
          ),

          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class USER_Accounts_Drawer extends StatelessWidget {
  final String text;
  final String textt;
  final Icon icon;
  USER_Accounts_Drawer({@required this.text,@required this.textt,@required this.icon});
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        text,
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
      accountEmail:
      Text(textt, style: TextStyle(fontSize: 20.0)),
      currentAccountPicture: GestureDetector(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(icon.icon,
            color: KIcons,
            size: 40.0,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: KIcons,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:medicoo/dashboard/dashboard_pharmacy/add_employee.dart';

import 'package:medicoo/dashboard/dashboard_pharmacy/order_page.dart';
import 'package:medicoo/screen/Home_screen.dart';
import 'package:medicoo/screen/loginScreen.dart';

import 'package:medicoo/widget/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Navigation_drawer extends StatefulWidget {
  @override
  _Navigation_drawerState createState() => _Navigation_drawerState();
}

// ignore: camel_case_types
class _Navigation_drawerState extends State<Navigation_drawer> {
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = "token";
    final value = token;
    prefs.setString(key, value);
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Medico",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            accountEmail:
                Text("Medico@gmail.com", style: TextStyle(fontSize: 20.0)),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: KIcons,
                  size: 40.0,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: KIcons,
            ),
          ),
          Expanded(
            child: Container(
              color: kMainColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home_Page()));
                      },
                      child: ListTile(
                        title: Text(
                          "HOME",
                          style: TextStyle(
                              color: KIcons,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Add_Employee()));
                      },
                      child: ListTile(
                        title: Text(
                          "ADD EMPLOYEE",
                          style: TextStyle(
                              color: KIcons,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ORDER_Page()));
                      },
                      child: ListTile(
                        title: Text(
                          "ORDERS",
                          style: TextStyle(
                              color: KIcons,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: () {
                        _save("0");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_Page()));
                      },
                      child: ListTile(
                        title: Text(
                          "LOGOUT",
                          style: TextStyle(
                              color: KIcons,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

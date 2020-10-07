import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


import 'package:medicoo/Dashboard/Controller_users/Home_User_Screen.dart';
import 'package:medicoo/UI/Coustm_widget/constant.dart';
import 'package:medicoo/UI/Coustm_widget/custom_drawer.dart';

import 'package:medicoo/UI/Screens/loginScreen.dart';

import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class Navigation_drawer_user extends StatefulWidget {
  @override
  _Navigation_drawer_userState createState() => _Navigation_drawer_userState();
}

// ignore: camel_case_types
class _Navigation_drawer_userState extends State<Navigation_drawer_user> {
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
          USER_Accounts_Drawer(
            text: "medico",
            textt: "MEDICO@gmail.com",
            icon: Icon(Icons.person),
          ),
          Expanded(
            child: Container(
              color: kMainColor,
              child: Padding(
                padding: const EdgeInsets.only(top:50.0, left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[



                    InkWell_Drawer(
                      text: "HOME",
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home_User_Screen()));
                      },
                    ),

                    InkWell_Drawer(
                      text: "LOGOUT",
                      function: () {
                        _save("0");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_Page()));
                      },
                    ),
                    SizedBox(
                      height: 20.0,
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

// ignore: camel_case_types

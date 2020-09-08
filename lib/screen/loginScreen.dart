import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicoo/Api/login_model_user.dart';
import 'package:medicoo/Api/model_login.dart';
import 'dart:convert';
import 'package:medicoo/screen/Home_screen.dart';
import 'package:medicoo/screen/login_employee.dart';
import 'package:medicoo/screen/registrastion.dart';
import 'package:medicoo/screen/user_home.dart';
import 'package:medicoo/widget/constant.dart';
import 'package:medicoo/widget/customTextFormField.dart';
import 'package:medicoo/widget/flatbutton.dart';
import 'package:medicoo/Api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class Login_Page extends StatefulWidget {
  @override
  @override
  _Login_PageState createState() => _Login_PageState();
}

// ignore: camel_case_types
class _Login_PageState extends State<Login_Page> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  TextEditingController UserNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isloading = false;
  bool loginError = false;

  // ignore: non_constant_identifier_names
  login_Api login_api = login_Api();
  Login_User login_user = Login_User();
  LoginData loginData = LoginData();
  String user;
  String password;

  // ignore: must_call_super

  void dispose() {
    UserNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE1FFF7),
      body: isloading ? _drawLoading() : _drawLoginForm(),
    );
  }

  Widget _drawLoginForm() {
    if (loginError) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Login Error ",
                style: TextStyle(fontSize: 25.0),
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    loginError = false;
                  });
                },
                child: Text(
                  "Try Again",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      );
    }
    final height = MediaQuery.of(context).size.height;
    return Form(
      key: _globalKey,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 100, bottom: 10),
                      child: Center(
                        child: Container(
                          height: 75,
                          width: 150,
                          child: Image.asset("asset/images/logo.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "MEDI",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "CO",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2EBDAB)),
              ),
            ],
          ),
          SizedBox(
            height: height * .1,
          ),
          customTextFornField(
            hint: "Enter Your User",
            iconData: Icons.person,
            controller: UserNameController,
          ),
          SizedBox(
            height: height * .02,
          ),
          customTextFornField(
            hint: "Enter Your Password",
            iconData: Icons.lock,
            controller: passwordController,
          ),
          SizedBox(
            height: height * .03,
          ),
          flatbutton(
            string: "Continue",
            color: KButton,
            function: () async {
              if (_globalKey.currentState.validate()) {
                setState(() {
                  isloading = true;
                });
                user = UserNameController.text;
                password = passwordController.text;
                print("hhhooooooh");
                var response = await login_api.login(user, password);
                print("hhhh");
                if (response) {
                  print("7mad");
                  final prefs = await SharedPreferences.getInstance();
                  var Logintype = prefs.getString("logintype");
                  print(Logintype);
                  if (Logintype == "manger") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Home_Page();
                    }));
                    // ignore: unrelated_type_equality_checks
                  } else if (Logintype == "user") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Home_User();
                    }));
                  }
                } else {
                  loginError = true;
                }
                setState(() {
                  isloading = false;
                });
              } else {
                setState(() {
                  isloading = false;
                });
              }
            },
          ),
          SizedBox(
            height: height * .04,
          ),
          InkWell(
            child: Text(
              "Create New Account ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Registration()));
            },
          ),
          SizedBox(
            height: height * .04,
          ),
          InkWell(
            child: Text(
              "Login Employee?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Login_Employee()));
            },
          ),
        ],
      ),
    );
  }

  Widget _drawLoading() {
    return Container(
        child: Center(
      child: CircularProgressIndicator(),
    ));
  }
}

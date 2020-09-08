import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:medicoo/widget/constant.dart';
import 'package:medicoo/widget/customTextFormField.dart';
import 'package:medicoo/widget/flatbutton.dart';
import 'package:medicoo/Api/api.dart';

import 'loginScreen.dart';
// ignore: camel_case_types
class Registrastion_NewUser extends StatefulWidget {
  @override
  _Registrastion_NewUserState createState() => _Registrastion_NewUserState();
}
// ignore: camel_case_types
class _Registrastion_NewUserState extends State<Registrastion_NewUser> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController EmailController = TextEditingController();
  TextEditingController UserController = TextEditingController();
  TextEditingController NamedController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isloading = false;
  bool loginError = false;
  Registrastion_User registrastion_user = Registrastion_User();
  String email;
  String password;
  String user;
  String name;
  String phone;

  void dispose() {
    EmailController.dispose();
    UserController.dispose();
    NamedController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.01,
        iconTheme: IconThemeData(
          color: KIcons,
        ),
      ),

      backgroundColor: kMainColor,
      body: isloading ? _drawLoading() : _drawRegistrastionFrom(),
    );
  }

  Widget _drawRegistrastionFrom() {
    if (loginError) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Registrastion Error ",
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
            padding: EdgeInsets.only(top:height *0.01),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 0, bottom: 5),
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
            height: height * .04,
          ),
          customTextFornField(
            hint: "Enter Your Email",
            iconData: Icons.email,
            controller: EmailController,
          ),
          SizedBox(
            height: height * .02,
          ),
          customTextFornField(
            hint: "Enter Your User",
            controller: UserController,
            iconData: Icons.person,
          ),
          SizedBox(
            height: height * .02,
          ),
          customTextFornField(
            hint: "Enter Your Name",
            controller: NamedController,
            iconData: Icons.person,
          ),
          SizedBox(
            height: height * .02,
          ),
          customTextFornField(
            hint: "Enter Your Mobile",
            controller: phoneController,
            iconData: Icons.phone_in_talk,
          ),
          SizedBox(
            height: height * .02,
          ),
          customTextFornField(
            hint: "Enter Your Password",
            controller: passwordController,
            iconData: Icons.lock,
          ),
          SizedBox(
            height: height * .03,
          ),
           // Call Api
          flatbutton(
            string: "Continue",
            color: KButton,
            function: () async {
              if (_globalKey.currentState.validate()) {
                setState(() {
                  isloading = true;
                });

                user = UserController.text;
                name = NamedController.text;
                phone = phoneController.text;
                email = EmailController.text;
                password = passwordController.text;
                var response = await registrastion_user.registrastion_User(
                    user, name, phone, email, password);
                if (response) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Login_Page();
                  }));
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
            height: height * .05,
          ),
        ],
      ),
    );
  }

  // drawLoading  Check User Loading or No
  Widget _drawLoading() {
    return Container(
        child: Center(
      child: CircularProgressIndicator(),
    ));
  }
}

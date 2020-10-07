import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicoo/Dashboard/Controller_empolyee/dashboard.dart';
import 'package:medicoo/NetWork/Repository/api.dart';
import 'package:medicoo/UI/Coustm_widget/constant.dart';




import 'package:medicoo/UI/Coustm_widget/customTextFormField.dart';
import 'package:medicoo/UI/Coustm_widget/flatbutton.dart';



// ignore: camel_case_types
class Login_Employee extends StatefulWidget {
  @override
  @override
  _Login_EmployeeState createState() => _Login_EmployeeState();
}

// ignore: camel_case_types
class _Login_EmployeeState extends State<Login_Employee> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  TextEditingController UserNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isloading = false;
  bool loginError = false;

  // ignore: non_constant_identifier_names
  login_Employee login_employee =login_Employee();
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
      body: isloading ? _drawLoading():_drawLoginForm()  ,
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

                var response = await login_employee.login(user, password);

                if (response) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Dashboard();
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

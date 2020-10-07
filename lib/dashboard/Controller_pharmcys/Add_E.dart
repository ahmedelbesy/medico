import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicoo/NetWork/Link_Api/linkapi.dart';
import 'package:medicoo/NetWork/Models/model_login.dart';
import 'package:medicoo/NetWork/Repository/api.dart';
import 'package:medicoo/UI/Coustm_widget/constant.dart';
import 'package:medicoo/UI/Coustm_widget/customTextFormField.dart';
import 'package:medicoo/UI/Coustm_widget/flatbutton.dart';



import 'package:http/http.dart' as http;
import 'package:medicoo/UI/Screens/loginScreen.dart';



// ignore: camel_case_types
class Add_Employee extends StatefulWidget {
  @override
  @override
  _Add_EmployeeState createState() => _Add_EmployeeState();
}

// ignore: camel_case_types
class _Add_EmployeeState extends State<Add_Employee> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();


  // ignore: non_constant_identifier_names
  TextEditingController UserNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isloading = false;
  bool loginError = false;

//  login_Api login_api = login_Api();
  // ignore: non_constant_identifier_names
  Registrastion_Employee registrastion_employee = Registrastion_Employee();

  String user;
  String password;
  // ignore: non_constant_identifier_names
  String manger_id;
  // ignore: non_constant_identifier_names
  String employee_type_id;
  // ignore: non_constant_identifier_names
  String create_from;

  void dispose() {
    UserNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  String x="";
  String y="";
  void initState() {
    _getStateList();
    UserLocalStorage.getUser().then((value) {

      setState(() {
        loginData=value;
        y=loginData.data.orgName;
        x=loginData.data.id.toString();
      });
    });
    super.initState();

  }

  String _myState;
  LoginData loginData = LoginData();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.01,
        iconTheme: IconThemeData(
          color: KIcons,
        ),
      ),
      backgroundColor: Color(0xFFE1FFF7),
      body: isloading ? _drawLoading():_drawLoginForm(),
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
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
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
            height: height * 0.03,
          ),
          Text(
            "ADD EMPLOYEE",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
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
            height: height * .02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              padding: EdgeInsets.only(left: 40.0, right: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              height: height * 0.08,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _myState,
                    iconSize: 30,
                    iconEnabledColor: KIcons,
                    icon: (null),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    hint: Text('Select org'),
                    onChanged: (String newValue) {
                      setState(() {
                        _myState = newValue;
                        _getStateList();
                        //   print(_myState);
                      });
                    },
                    items: statesList?.map((item) {
                      return new DropdownMenuItem(
                        child: new Text(item['name']),
                        value: item['id'].toString(),
                      );
                    })?.toList() ??
                        [],
                  ),
                ),
              ),
            ),
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
                employee_type_id=_myState.toString();
                manger_id =  x ?? loginData.data.id.toString() ; //id بتاع الصيدلية
                create_from= y ?? loginData.data.orgName.toString() ; //  اسم الصيدلية

                var response = await registrastion_employee.registrastion_User(
                    user, password, manger_id, employee_type_id, create_from);
                if (response) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login_Page()));


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

  Widget _drawLoading() {
    return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ));
  }

  List statesList;
  String stateInfoUrl = base_api + dropdown_employee;

  // ignore: missing_return
  Future<String> _getStateList() async {

    await http.get(stateInfoUrl).then((response) {
      var data = json.decode(response.body);
      if(response.statusCode==200){
        setState(() {
          statesList = data['data'];
        });
      }else {
        print(response.statusCode);
      }


    });
  }
}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicoo/Api/api.dart';
import 'package:medicoo/Api/linkapi.dart';

import 'package:medicoo/widget/constant.dart';
import 'package:medicoo/widget/customTextFormField.dart';
import 'package:medicoo/widget/flatbutton.dart';
import 'package:http/http.dart' as http;

import 'loginScreen.dart';

// ignore: camel_case_types
class Registrastion_Establishment extends StatefulWidget {

  @override
  _Registrastion_EstablishmentState createState() =>
      _Registrastion_EstablishmentState();
}

class _Registrastion_EstablishmentState
    extends State<Registrastion_Establishment> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _myState;
  TextEditingController JopController = TextEditingController();
  TextEditingController UserController = TextEditingController();
  TextEditingController NamedController = TextEditingController();
  TextEditingController Org_NamedController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController Org_phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  bool isloading = false;
  bool loginError = false;
  Registrastion_org registrastion_org = Registrastion_org();
  String jop;
  String password;
  String user;
  String name;
  String org_phone;
  String org_name;
  String location;
  String org_type_id;

  void dispose() {
    Org_NamedController.dispose();
    JopController.dispose();
    UserController.dispose();
    NamedController.dispose();
    passwordController.dispose();
    Org_phoneController.dispose();
    locationController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _getStateList();
    super.initState();
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
      body: isloading ? _drawLoading() : _drawRegistrastion_org_Form(),
    );
  }

  // Form
  Widget _drawRegistrastion_org_Form() {
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
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 5),
                        child: Center(
                          child: Container(
                            height: 75.0,
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
              hint: "Enter Your User",
              iconData: Icons.person,
              controller: UserController,
            ),
            SizedBox(
              height: height * .02,
            ),
            customTextFornField(
              controller: Org_NamedController,
              hint: "Enter Your Org_Name",
              iconData: Icons.home,
            ),
            SizedBox(
              height: height * .02,
            ),
            customTextFornField(
              controller: locationController,
              hint: "Enter Your location",
              iconData: Icons.my_location,
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
              hint: "Enter Your Org_Mobile",
              iconData: Icons.phone_in_talk,
              controller: Org_phoneController,
            ),
            SizedBox(
              height: height * .02,
            ),
            customTextFornField(
              hint: "Enter Your Jop",
              iconData: Icons.work,
              controller: JopController,
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
            // Call Api
            flatbutton(
              string: "Continue",
              color: KButton,
              function: () async {
                if (_globalKey.currentState.validate()) {
                  setState(() {
                    isloading = true;
                  });


                  jop = JopController.text;
                  password = passwordController.text;
                  user = UserController.text;
                  name = NamedController.text;
                  org_phone = Org_phoneController.text;
                  org_name = Org_NamedController.text;
                  location = locationController.text;
                  org_type_id = _myState.toString();


                  var response = await registrastion_org.registrastion_Org(
                      user,
                      org_name,
                      name,
                      org_phone,
                      jop,
                      password,
                      location,
                      org_type_id);
                  if (response) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
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

  //call Api From Dropdown
  List statesList;
  String stateInfoUrl = base_api + dropdown;

  // ignore: missing_return
  Future<String> _getStateList() async {
    // ignore: missing_return
    await http.get(stateInfoUrl).then((response) {
      var data = json.decode(response.body);
     if(response.statusCode==200){
return
       setState(() {
         statesList = data['data'];
       });
     }else{
   print(response.statusCode);
     }


    });
  }
}


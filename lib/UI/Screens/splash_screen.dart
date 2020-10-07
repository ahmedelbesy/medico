import 'dart:async';

import 'package:flutter/material.dart';

import 'package:medicoo/UI/Screens/loginScreen.dart';
import 'package:medicoo/UI/Screens/sing_up.dart';



import 'package:shared_preferences/shared_preferences.dart';




class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

bool d=false;
@override
class _SplashState extends State<Splash> {
  read() async{
    final prefs=await SharedPreferences.getInstance();
    final key="token";
    final value=prefs.get(key)?? "0";

    if(value !="0"){
      Navigator.push( context, MaterialPageRoute(builder: (context)=>Login_Page()));
    }


  }
// ignore: must_call_super

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      if(d==read()) {
setState(() {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => Sing_Up()));
});



      }
      else {
        setState(() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Sing_Up()));
        });

      }
      read();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE1FFF7),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 150,
              width: 200,
              child: Image.asset(
                "asset/images/logo.png",

              ),
            ),
          ],
        )));
  }
}

import 'package:flutter/material.dart';
import 'package:medicoo/screen/onboarding.dart';
import 'package:medicoo/screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen=prefs.getBool('seen');
  Widget _screen ;
  if(seen==null||seen==false){
    //Goto home
    _screen=onboarding();
  }else{
    _screen=Splash();
  }
  runApp(MyApp(_screen));
}

class MyApp extends StatelessWidget {
  final Widget _screen;
  MyApp(this._screen);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
home: this._screen,

    );
  }

}


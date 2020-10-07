import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicoo/UI/Coustm_widget/constant.dart';



import 'package:medicoo/UI/Coustm_widget/flatbutton.dart';
import 'package:medicoo/UI/Screens/loginScreen.dart';
import 'package:medicoo/UI/Screens/registrastion_Establishment.dart';
import 'package:medicoo/UI/Screens/registrastion_newuser.dart';

// ignore: camel_case_types
class Sing_Up extends StatefulWidget {
  @override
  _Sing_UpState createState() => _Sing_UpState();
}
// ignore: camel_case_types
class _Sing_UpState extends State<Sing_Up> {

  void dispose() {

    super.dispose();
  }


  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:kMainColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: height * 0.1),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:35,bottom: 10),
                  child: Center(
                    child: Container(
                      height: 120,
                      width: 200,
                      child: Image.asset("asset/images/logo.png"),
                    ),
                  ),
                ),
                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "MEDI",
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "CO",
                      style: TextStyle(
                          fontSize:30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2EBDAB)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "WELCOME",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign in to continue",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]),
                ),
                SizedBox(
                  height: 40,
                ),
                flatbutton(
                  string: "New User",
                  color:KButton,
                  function: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Registrastion_NewUser();
                    }));
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "or",
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                flatbutton(
                  string: "Establishment",
                  color: Color(0xFF34528C),
                  function: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Registrastion_Establishment()));
                  },
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder:(context) =>Login_Page()));},
                      child: Text(
                        "Log",
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "in",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2EBDAB)),
                    ),
                  ],
                ),
                SizedBox(
                  height:height *0.1 ,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("By continuing you agree to"),
                    Text(
                      "Terms & Conditions",
                      style: TextStyle(color: Color(0xFF2EBDAB)),
                    ),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}





import 'package:flutter/material.dart';
import 'package:medicoo/UI/Coustm_widget/constant.dart';




class customTextFornField extends StatelessWidget {
  customTextFornField({
    this.hint,
    this.iconData,
     this.controller,
  });
  final String hint;
  final IconData iconData;
  final TextEditingController controller;

   // ignore: missing_return
   String _errorMessage(){
     switch(hint){

     case "Enter Your location" : return "Enter Your location";
       case "Enter Your Email" : return "Enter Your Email";
       case "Enter Your User" : return "Enter Your User";
       case "Enter Your Name" : return "Enter Your Name";
       case "Enter Your Org_Name" : return "Enter Your Org_Name";
       case "Enter Your Org_Mobile" : return "Enter Your Org_Mobile";
       case "Enter Your Mobile" : return "Enter Your Mobile";
       case "Enter Your Password" : return "Enter Your Password";
       case "Enter Your Jop" : return "Enter Your Jop";
     }
   }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        // ignore: missing_return
        validator: (value) {
          if (value.isEmpty) {
            return _errorMessage();
          }
        },

        cursorColor: KIcons,
        obscureText: hint=='Enter Your Password' ?true :false,
        controller: controller,
        decoration: InputDecoration(

          hintText: hint,
          prefixIcon: Icon(
            iconData,
            color:KIcons,
          ),
          filled: true,
          fillColor: kSecondColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class textformfield extends StatelessWidget {
  textformfield({
    @required this.controller,
    this.hinttext,
    this.maxNum,
    this.prefixicon,
    this.suffixicon,
    this.suffixiconcolor,
    this.suffixiconfunction,
 this.textinputtype,
    // ignore: non_constant_identifier_names
    this.ObscureText=false,
  });

  final TextEditingController controller;
  final int maxNum;
  final String hinttext;
  final IconData prefixicon;
  final IconData suffixicon;
  final Color suffixiconcolor;
  final Function suffixiconfunction;
  final TextInputType textinputtype;
  // ignore: non_constant_identifier_names
  final bool ObscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 25.0),
      child: Container(
        height: 60.0,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          child: Container(
            height: 75.0,
            child: TextFormField(
             obscureText: ObscureText,
              keyboardType: textinputtype,
              maxLength: maxNum,
              controller: controller,
              decoration: InputDecoration(
                hintText: hinttext,
                prefixIcon: Icon(prefixicon),
                suffixIcon: IconButton(
                  icon: Icon(
                    suffixicon,
                    color: suffixiconcolor,
                  ),
                  onPressed: suffixiconfunction,
                ),
                border: OutlineInputBorder(
                    borderRadius: (BorderRadius.all(Radius.circular(30.0)))),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(
                    30.0,
                  )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

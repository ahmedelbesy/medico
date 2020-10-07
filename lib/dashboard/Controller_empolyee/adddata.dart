import 'package:flutter/material.dart';
import 'package:medicoo/Dashboard/Controller_empolyee/dashboard.dart';

import 'package:medicoo/NetWork/Repository/api.dart';


import 'package:medicoo/UI/Coustm_widget/constant.dart';


class AddData extends StatefulWidget {
  AddData({Key key, this.title}) : super(key: key);
  final String title;

  @override
  AddDataState createState() => AddDataState();
}

class AddDataState extends State<AddData> {
  DatabaseHelper databaseHelper = new DatabaseHelper();



  TextEditingController _nameController = new TextEditingController();
  TextEditingController _priceController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: KIcons,
          ),
          backgroundColor: kMainColor,
          elevation: 0.01,
          centerTitle: true,
          title: Text('Add Product',
              style: TextStyle(fontSize: 30.0, color: KIcons)),
        ),
        body: SafeArea(
          child: Container(
            child: ListView(
              padding: const EdgeInsets.only(
                  top: 62, left: 12.0, right: 12.0, bottom: 12.0),
              children: <Widget>[
                Container(
                  height: 50,
                  child: new TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Product Name',
                      icon: new Icon(
                        Icons.dashboard,
                        color: KIcons,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  child: new TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'price',
                      icon: new Icon(
                        Icons.attach_money,
                        color: KIcons,
                      ),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 44.0),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 50,
                    child: new RaisedButton(
                      onPressed: () {
                        var name = _nameController.text.toString();
                        var price = _priceController.text.toString();
                        databaseHelper.addData(
                          login_Employee.Manger_Id.toString(),
                          login_Employee.Employee_id.toString(),
                          name.toString(),
                          price.toString(),
                          login_Employee.User.toString(),
                        );
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Dashboard(),
                        ));
                      },
                      color: KIcons,
                      child: new Text(
                        'Add',
                        style: new TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

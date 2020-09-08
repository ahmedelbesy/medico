import 'package:flutter/material.dart';
import 'package:medicoo/Api/model_login_employee.dart';
import 'package:medicoo/Produt_Employee/dashboard.dart';


import 'package:medicoo/widget/constant.dart';

import '../Api/api.dart';

// ignore: must_be_immutable
class EditData extends StatefulWidget {
  List list;
  int index;

  EditData({this.index, this.list});

  @override
  EditDataState createState() => EditDataState();
}

class EditDataState extends State<EditData> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  TextEditingController _nameController;

  TextEditingController _priceController;

  LoginEmployee loginEmployee = LoginEmployee();

  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController =
        new TextEditingController(text: widget.list[widget.index]['name']);
    _priceController =
        new TextEditingController(text: widget.list[widget.index]['price']);

  }
  // ignore: non_constant_identifier_names
  var employee_id = login_Employee.Employee_id.toString();

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
          title: Text('Update Product',
              style: TextStyle(fontSize: 30.0, color: KIcons)),
        ),
        body: Container(
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
                    labelText: 'Name',
                    hintText: 'Product Name',
                    icon: new Icon(Icons.dashboard,color: KIcons,),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    hintText: 'Place your price',
                    icon: new Icon(Icons.attach_money,color: KIcons,),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 20.0,right: 20.0),
                child: Container(
                  height: 50,
                  child: new RaisedButton(
                    onPressed: () {

                      databaseHelper.editData(
                          widget.list[widget.index]['id'].toString(),
                          employee_id.toString(),
                          _nameController.text.toString(),
                          _priceController.text.toString());
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) =>  Dashboard(),
                      ));
                    },
                    color:KIcons,
                    child: new Text(
                      'Update',
                      style: new TextStyle(
                          color: Colors.white,),
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
